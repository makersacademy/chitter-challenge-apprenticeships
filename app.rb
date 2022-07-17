require 'sinatra/base'
require './lib/peeps'
require 'time'

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
    time = Time.now.httpdate
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (message, posted) VALUES('#{message}', '#{time}')")
    redirect '/'
  end





  run! if app_file == $0
end
