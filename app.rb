require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb (:index)
  end

  post '/send-peep' do
    @peep = Peeps.create(params[:new_peep])
    redirect to('/')
  end

  run! if app_file == $0
end
