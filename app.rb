require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/chitter'
  end
  
  get '/chitter' do
    @peeps = Peeps.all
    erb :'/chitter'
  end
  
  post '/chitter' do
    Peeps.create(message: params[:peep])
    redirect '/chitter'
  end

  get '/chitter/new' do
    erb :'/chitter/new'
  end

  post '/chitter/keywords/new' do
    @search = Peeps.like(keyword: params[:keyword])
    redirect '/chitter/keywords'
  end


  get '/chitter/keywords' do
    erb :'/chitter/keywords'
  end

  run! if app_file == $0
end
