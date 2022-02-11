require 'sinatra/base'
require './lib/messages'
# require 'sinatra/reloader'

class Chitter < Sinatra::Base
  # configure :development do
  #   register Sinatra::Reloader
  # end

  get '/test' do
    'Test page'
  end

  get '/view_messages' do
    @messages = Messages.all
    erb :'messages/index'
  end

  run! if app_file == $0
end
