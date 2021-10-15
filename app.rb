require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/create-peep' do
    erb(:create_peep)
  end

  post '/new-peep' do
    Peep.create(params[:message], params[:username], Date.today.strftime('%d/%m/%Y'))
    redirect('/peeps')
  end

  post '/filtered-peeps' do
    @peeps = Peep.filter(params[:filter])
    erb(:filter_peeps)
  end

  run! if app_file == $0
end
