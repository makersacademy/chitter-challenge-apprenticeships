require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/add' do
    erb :'peeps/add'
  end

  post '/peeps' do
    Peep.add(peep: params[:peep])
    # peep = params['peep']
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (message) VALUES('#{peep}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
