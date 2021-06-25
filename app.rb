require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peeps.create(username: params[:username], message: params[:peeps])
    redirect '/'

#    peep = params['peep']
#    connection = PG.connect(dbname: 'chitter_test')
#    connection.exec("INSERT INTO peeps (message) VALUES('#{peep}')")
#    redirect '/peeps'
  end

  run! if app_file == $0
end
