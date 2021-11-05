require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @messages = Message.all
    erb :messages
  end

  post '/' do
    Message.create(message: params[:message])
    redirect '/'
  end

  get '/new' do
    erb :new
  end

  run! if app_file == $0
end
