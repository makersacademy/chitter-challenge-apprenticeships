require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    all_peeps = connection.exec("SELECT * FROM peeps")
    @all_peeps = all_peeps.map { |peep| peep['message'] }
    erb :messages
  end

  post '/messages/peep' do
    new_peep = params[:new_peep]
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec_params("INSERT INTO peeps (message) VALUES($1);", [new_peep])
    redirect '/messages'
  end

  run! if app_file == $0
end
