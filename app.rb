require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
   erb :index
  end

  post '/messages' do
    @user_name = (params[:user_name])
    @messages = Message.all
    erb :messages
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  run! if app_file == $0
end
