require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/message' do
    Message.create(params[:message])
  end

  get '/messages' do
    @messages = Message.all
    p @messages
    erb :messages
  end

  run! if app_file == $0
end
