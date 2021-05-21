require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter'
  end

  run! if app_file == $0
end
