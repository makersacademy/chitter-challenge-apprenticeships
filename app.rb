require 'sinatra/base'

class Chitter < Sinatra::Base
  require 'sinatra/reloader' if development?

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
