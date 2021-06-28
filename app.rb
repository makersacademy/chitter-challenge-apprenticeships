require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/new-peep' do
    Peep.new(params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
