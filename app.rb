require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
