require 'sinatra/base'
require './lib/peeps'
require './lib/sequence'
require 'pg'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @peeps = Peeps.all
    @orderby = Sequence.whatorder
    @peepsreversechrono = Peeps.reverse
    erb :'chitter/index'
  end

  get '/chitter/newpeep' do
    erb :'chitter/newpeep'
  end

  post '/chitter' do
    Peeps.create(message: params[:peep])
    redirect '/chitter'
  end

  post '/chitter/reverse' do
    Sequence.order(false)
    redirect '/chitter'
  end

  post '/chitter/chrono' do
    Sequence.order(true)
    redirect '/chitter'
  end

  run! if app_file == $0
end
