require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
 
  get '/' do
    'Hello'
  end

  get '/peeps' do
    p ENV

    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0
end
