require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/' do
    Peeps.create(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
