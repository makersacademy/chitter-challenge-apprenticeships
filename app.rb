require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/messages' do
    @peeps = Message.all
    erb :'messages/index'
  end
  
  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  run! if app_file == $0
end
