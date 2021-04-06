require 'sinatra/base'
require_relative 'database_connection_setup'
require 'uri'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  Dir[settings.root + '/lib/*.rb'].each { |file| require file }

  get '/sign_up' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/')
    end
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    Peep.create(message: params[:message], post_date: params[:post_date])
    redirect '/peeps'
  end

  get '/search' do
    @peeps = session[:search]
    erb(:'peeps/search')
  end

  post '/search' do
    session[:search] = Peep.search(search: params[:search])
    redirect '/search'
  end

  run! if app_file == $0
end
