require 'sinatra/base'
require './lib/database'

class Chitter < Sinatra::Base

  get '/messages' do
    @messages = Database.get_messages
    erb :messages
  end

  post '/messages' do
    Database.add_message(text: params['message'])
    redirect "/messages"
  end

  get '/messages/new' do
    erb(:"messages/new")
  end
  run! if app_file == $0
end
