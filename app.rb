require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    p @peeps
    erb :'index' 
  end

  get '/new' do
    erb :'new'
  end

  post '/' do
    message = params['message']
    p params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    # redirect '/'
  end





  run! if app_file == $0
end
