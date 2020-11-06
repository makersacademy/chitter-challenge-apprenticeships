require 'sinatra/base'
require 'sinatra/flash'

require_relative 'lib/chitter'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :public_folder, 'public'
  register Sinatra::Flash

  get '/test' do
    'Test page'
  end

  get '/' do
    erb :FrontPage
  end

  post '/HomePage' do
    session[:name] = params[:Username]
    redirect '/HomePage'
  end

  get '/HomePage' do
    @name = session[:name]
    @peeps = Peeps.all
    erb :HomePage
  end

  post '/new' do
    flash[:notice] = "The peep you submitted is too long" unless Peeps.post(cheep: params[:new_peep])
    redirect '/HomePage'
  end

  get '/new' do
    erb :new
  end

  run! if app_file == $0
end
