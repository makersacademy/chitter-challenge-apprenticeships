require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'database_connection_setup'
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
    erb :index
  end

  post '/add' do
    Peeps.create(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
