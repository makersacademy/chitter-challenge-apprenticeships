require './lib/message'
require './database_connection_setup'
require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  
  register Sinatra::Reloader
  
  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/' do
    Message.peep(message: params[:message])
    
    redirect '/'
  end

  run! if app_file == $0
end
