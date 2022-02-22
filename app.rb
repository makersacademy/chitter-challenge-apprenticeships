require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter_manager'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = ChitterManager.all
    erb :index
  end

  post '/post' do
    ChitterManager.post(message: params[:message])
    redirect '/chitter'
  end

  run! if app_file == $0
end
