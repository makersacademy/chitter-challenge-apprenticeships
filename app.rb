require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb(:chitter)
  end

  post '/add_peep' do
    erb(:add_peep_view)
  end

  post '/chitter' do
    Peeps.add(peep_text: params['peep_text'])
    redirect '/chitter'
  end

  run! if app_file == $0
end
