require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = Message.all
    erb :index
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
