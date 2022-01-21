require 'sinatra/base'
require './lib/database'
require './lib/users'
class Chitter < Sinatra::Base
  enable :sessions

  get '/messages' do
    check_logged_in
    @user = session[:user]
    @messages = Database.get_messages
    erb :messages
  end

  post '/messages' do
    Database.add_message(text: params['message'])
    redirect "/messages"
  end

  get '/messages/new' do
    check_logged_in
    erb(:"messages/new")
  end

  get '/' do
    erb :"login"
  end

  post '/login' do
    if !Users.authenticate(username: params[:user], password: params[:password])
      redirect :"/"
    end
    session[:user] = params[:user]
    redirect :messages
  end

  get '/login/new' do
    erb :"login/new"
  end

  post '/login/new' do
    if !Users.create(username: params[:user], password: params[:password])
      redirect :"/login/new"
    end
    session[:user] = params[:user]
    redirect :messages
  end

  def check_logged_in
    if session[:user] == nil
      redirect '/'
    end
  end
  run! if app_file == $0
end
