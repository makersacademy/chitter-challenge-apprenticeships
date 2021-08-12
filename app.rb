require 'sinatra/base'
require 'sinatra/reloader'
require './lib/messages'

class Chitter < Sinatra::Base

  get '/' do
    'Test page'
  end

  get '/messages' do
    @messages = Messages.all
    erb :messages
  end 

  get '/messages/new' do 
    erb :new_message
  end 

  post '/messages' do 
    Messages.create(message: params[:message])
    redirect '/messages'
end
  run! if app_file == $0
end
