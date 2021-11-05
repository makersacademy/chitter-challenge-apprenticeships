require 'sinatra/base'
require_relative './lib/peep_messages'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do 
     ENV
    @peeps = PeepMessages.all
    erb :index
  end 

  post '/messages' do 
    p@message = params[:textarea] 
    redirect '/show'
  end 

  get '/show' do 
    erb :messages
  end 
  run! if app_file == $0
end
