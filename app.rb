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

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    # message = params['message']
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
