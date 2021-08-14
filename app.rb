require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/home' do
    @peep = Peep.all
    erb :'home'
  end

  get '/home/post' do
    erb :'post'
  end

  post '/home' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/home'
  end

  run! if app_file == $0
end
