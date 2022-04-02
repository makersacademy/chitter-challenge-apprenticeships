require 'sinatra/base'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do 
  end

  run! if app_file == $0
end
