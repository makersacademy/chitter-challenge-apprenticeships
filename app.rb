require 'sinatra/base'
require 'sinatra/reloader'
require './lib/messages'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages/home' do
    @messages = Messages.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages' do
    Messages.create(message: params[:message])
    redirect 'messages/home'
  end

  get '/messageboard' do
    erb :"messages/message"
  end
  run! if app_file == $0
end
