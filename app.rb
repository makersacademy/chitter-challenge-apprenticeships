require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep.rb'

class Chitter < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  run! if app_file == $0
end
