require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = ChitterMessage.all
    # @messages = ["This is a peep!", "This is an emergency!"]
    erb :index
  end

  run! if app_file == $0
end
