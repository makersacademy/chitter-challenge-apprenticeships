require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require 'haml'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Peeps.all
    haml :index
  end

  post '/send-peep' do
    @peep = Peeps.create(params[:new_peep])
    redirect to('/')
  end

  run! if app_file == $0
end
