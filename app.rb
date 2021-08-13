require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  get '/new' do
    erb :'new'
  end

  post '/peeps' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
