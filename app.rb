require 'sinatra/base'
require './lib/chitter_db'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end

  get '/view' do
    @chitter = Peeps.all
    erb :'view' 
  end

  run! if app_file == $0
end
