require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'/peeps/index')
  end

  post '/peeps' do
    Peep.add(params['message'])
    redirect('/peeps')
  end

  get '/peeps/add' do
    erb(:'/peeps/add')
  end

  run! if app_file == $0
end
