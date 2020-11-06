require 'sinatra/base'
require 'sinatra/activerecord'
require './database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "very secret"


  get '/test' do
    'Test page'
  end

  get '/' do
    if session[:user]
      redirect to '/peeps'
    else
      redirect to 'login'
    end
  end

  get '/login' do
    erb :login, :layout => :layout
  end

  post '/session' do
  end

  get '/users/new' do
    erb :signup, :layout => :layout
  end

  post '/users' do
    user = User.new(params[:user])
    user.save!
    redirect to '/test'
  end

  run! if app_file == $0
end
