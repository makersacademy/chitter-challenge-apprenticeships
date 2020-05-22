require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    "Homepage"
  end

  get '/chitter' do
    @chits = Chits.peeps
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitter/new' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end

  post '/chitter' do
    message = params['message']
    p params
    Chits.create(message: message)
    redirect '/chitter'
  end



  run! if app_file == $0
end
