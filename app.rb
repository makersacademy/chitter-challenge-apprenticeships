require 'sinatra/base'
require_relative './lib/messages'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
    'Chitter'
  end

  get '/messages' do
    @messages = Messages.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Messages.create(message: params['message'], date_posted: params['date'])
    redirect '/messages'
  end


  run! if app_file == $0
end
