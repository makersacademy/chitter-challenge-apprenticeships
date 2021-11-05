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
   p @message = params[:message] 
   PeepMessages.create(message: params[:message])
   redirect '/messages'
   end 

  run! if app_file == $0
end
