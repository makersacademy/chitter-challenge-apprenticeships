require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter Home'
  end

  get '/messages' do
    @messages = Message.all
    
    erb :messages
  end

  get '/messages/new' do
    erb :new
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  run! if app_file == $0
end
