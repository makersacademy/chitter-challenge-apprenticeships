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

  get '/messages' do
    @messages = ChitterMessage.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    message = params['message']
    messagedate = params['messagedate']
    
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{messagedate}')")
    redirect '/messages'
  end

  run! if app_file == $0
end
