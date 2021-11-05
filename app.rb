require 'sinatra/base'
require './lib/peeps'
require 'pg'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @peeps = Peeps.all
    erb :'chitter/index'
  end

  get '/chitter/newpeep' do
    erb :'chitter/newpeep'
  end

  post '/chitter' do
    Peeps.create(message: params[:peep])
    redirect '/chitter'
  end

  get '/chitter/reverse' do
    Peeps.all.reverse.sort_by { |peep| peep.id }
    p @peeps
    erb :'chitter/reverse'
  end

  run! if app_file == $0
end
