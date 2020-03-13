require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :"/peeps/new"
  end

  post '/peeps' do
# Change toute cette partie pour que ca soit fait sous le model de MVC
    # message = params['message']
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    Peep.post(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
