require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  register Sinatra::Reloader

  get '/' do 
    erb :index
  end

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
