require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = Messages.all
    erb :messages
  end


  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages' do
    Messages.add(message: params[:message])
    redirect '/messages'
  end


  run! if app_file == $0
end
