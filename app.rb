require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/test' do
    'Test page'
  end

  get '/message' do
    @messages = ChitterMessage.all
    erb :index
  end

  get '/newpost' do
    erb :new
  end

  post '/newpost' do
    message = params['message']
  connection = PG.connect(dbname: 'chitter')
  connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  redirect '/message'
  end



  

  
  run! if app_file == $0
end
