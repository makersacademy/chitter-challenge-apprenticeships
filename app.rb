require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base
  
  get '/' do
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
