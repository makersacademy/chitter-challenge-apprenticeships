require 'sinatra/base'
require 'sinatra/reloader' if development?

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  
  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
