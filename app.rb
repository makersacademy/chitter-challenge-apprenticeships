require 'sinatra/base'
require 'peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @all_peeps = Peep.all
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
