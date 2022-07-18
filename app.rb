require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :'index'
  end

  get '/new' do
    erb :"new_peep"
  end

  post '/' do
    peep = params['peep']
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO chitter (peep) VALUES('#{peep}')")
    redirect '/'
    p "Peep sent!"
  end

  run! if app_file == $0
end
