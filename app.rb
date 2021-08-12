require 'sinatra/base'
require 'sinatra/reloader'
require './lib/messages'

class Chitter < Sinatra::Base

  get '/' do
    'Test page'
  end

  get '/messages' do
    @messages = Messages.all
    erb :messages
  end 

  get '/messages/new' do 
    erb :new_message
  end 

  post '/messages' do 
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/messages'
end
  run! if app_file == $0
end
