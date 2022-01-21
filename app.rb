require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/' do
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec('SELECT message FROM peeps;')
    @peeps = result.map { |row| row['message'] }
    erb :index
  end

  post '/' do
    message = params[:message]
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec_params('INSERT INTO peeps (message) VALUES ($1);', [message])
    redirect '/'
  end

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
