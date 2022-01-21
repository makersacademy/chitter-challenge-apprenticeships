require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb:index
  end

  run! if app_file == $0
end
