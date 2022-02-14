require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base
 
  get '/test' do
    'Test page'
  end

  get '/view_messages' do
    @messages = Messages.all
    erb :'messages/index'
  end
  
  get '/message/new' do
    erb :"messages/new"
  end
  post '/new_message' do
    p "message received"
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('#{message}')")
    redirect '/view_messages'
  end
  
  run! if app_file == $0
end
