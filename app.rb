require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    @peep = Peeps.all
    erb :'chitter/index'
  end

  run! if app_file == $0
end
