require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/home' do
    @header = "Chitter"
    erb :homepage
  end

  run! if app_file == $0
end
