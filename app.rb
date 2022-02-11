require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @peeps = ChitterManager.all
    erb :index
  end

  run! if app_file == $0
end
