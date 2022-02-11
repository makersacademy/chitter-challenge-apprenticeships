require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/message-board' do 
    # @message = Message.all 
    erb :index
  end 

  get '/message' do 
    erb :'message'
    # erb :'index' 
  end 

  # for the second test - creating a sinatra route 

  get '/message/new' do 
    erb :'message/new'
  end 

  post '/message' do 
   message = params['message']
   connection = PG.connect(dbname: 'chitter_test')
   connection.exec("INSERT INTO peeps (message) values ('#{message}');")
   redirect '/message'
  end 


  run! if app_file == $0
end
