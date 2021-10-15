require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  post '/peeps' do
    @all_peeps= Peep.all
    erb(:peeps)
  end
  
  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
