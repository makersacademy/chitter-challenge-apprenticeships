require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/message'

class Chitter < Sinatra::Base

  get '/messages' do 
   p @messages = Message.all
    erb :'messages/index'
  end 

  get '/messages/new' do 
    erb :'messages/new'
  end 

  post '/messages/new' do 
    new_post = params['new_post']
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("INSERT INTO peeps (message) values('#{new_post}');")
    redirect '/messages'
  end
  

  run! if app_file == $0
end
