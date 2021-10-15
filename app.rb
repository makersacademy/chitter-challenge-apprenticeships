require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    erb :peeps
  end

  run! if app_file == $0
end
