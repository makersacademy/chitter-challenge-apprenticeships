require 'sinatra/base'
require_relative 'lib/peeps'
require_relative 'lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @user = User.find(id: session[:user_id])
    @peeps = Peeps.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  get '/filter' do
    erb :filter
  end

  get '/:id/edit' do
    @peep = Peeps.find(id: params[:id])
    erb :'/edit'
  end

  get '/:id/comments/new' do
    @peep_id = params[:id]
    erb :'comments/new'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.add(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  post '/' do
    message = params[:message]
    Peeps.add(message)
    redirect '/'
  end

  post '/filter' do
    keyword = params[:keyword]
    @filtered_peeps = Peeps.filter(keyword)
    erb :results
  end

  post '/:id/comments' do
    DatabaseConnection.query("INSERT INTO comments (text, peep_id) VALUES('#{params[:comment]}', '#{params[:id]}');")
    redirect '/'
  end

  delete '/:id' do
    Peeps.delete(id: params[:id])
    redirect '/'
  end

  patch '/:id' do
    Peeps.update(id: params[:id], message: params[:message], date: Time.now.strftime("%Y-%m-%d"))
    redirect '/'
  end

  run! if app_file == $0
end
