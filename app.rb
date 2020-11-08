require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Welcome to Peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.create(message: params[:peeps])
    redirect '/peeps'

#    peep = params['peep']
#    connection = PG.connect(dbname: 'chitter_test')
#    connection.exec("INSERT INTO peeps (message) VALUES('#{peep}')")
#    redirect '/peeps'
  end

  run! if app_file == $0
end
