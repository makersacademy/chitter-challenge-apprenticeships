require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/user'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "very secret"
  register Sinatra::Flash

  get '/test' do
    'Test page'
  end

  get '/' do
    if session[:user_id]
      redirect to '/peeps'
    else
      redirect to 'login'
    end
  end

  get '/login' do
    erb :login, :layout => :layout
  end

  post '/session' do
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash[:error] = "Invalid username/password combination"
      redirect to '/login'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to '/'
  end

  get '/users/new' do
    erb :signup, :layout => :layout
  end

  post '/users' do
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      session[:user_id] = user.id
      redirect to '/peeps'
    else
      flash[:error] = "Invalid username or password"
      redirect to '/users/new'
    end
  end

  get '/peeps' do
    if params[:search].nil?
      @peeps = Peep.all
    else
      search_term = "%#{params[:search]}%"
      @peeps = Peep.where("message LIKE ?", search_term)
    end
    @peeps = @peeps.sort_by(&:created_at).reverse
    erb :peep_feed, :layout => :layout
  end

  post '/peeps' do
    peep = Peep.new(message: params[:message], user_id: session[:user_id])
    if peep.save
      flash[:success] = "Peep sent!"
    else
      flash[:error] = "Peep unsuccessful"
    end
    redirect to '/peeps'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    erb :user, :layout => :layout
  end

  post '/peeps/:id/delete' do
    peep = Peep.find(params[:id])
    if peep.user_id == session[:user_id]
      peep.destroy
    end
    redirect to '/peeps'
  end

  run! if app_file == $0
end
