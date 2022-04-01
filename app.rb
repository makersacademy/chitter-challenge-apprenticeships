require 'sinatra/base'
require './lib/peeps'
require './lib/sequence'
require './lib/database_connection'
require './lib/filter'
require './database_connection_setup'
require 'pg'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @peeps = Peeps.all
    @orderby = Sequence.whatorder
    @peepsreversechrono = Peeps.reverse
    @filter = Filter.query
    erb :'chitter/index'
  end

  get '/chitter/newpeep' do
    erb :'chitter/newpeep'
  end

  post '/chitter' do
    Peeps.create(message: params[:peep])
    redirect '/chitter'
  end
  
  post '/chitter/chrono' do
    Sequence.order(true)
    redirect '/chitter'
  end

  post '/chitter/reverse' do
    Sequence.order(false)
    redirect '/chitter'
  end

  post '/chitter/filter' do
    Filter.include(params[:filter])
    redirect '/chitter/filter'
  end

  get '/chitter/filter' do
    @filter = Filter.query
    @filteredpeeps = Peeps.filter(@filter)
    @filteredpeeps
    erb :'chitter/filter'
  end

  run! if app_file == $0
end
