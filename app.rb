require 'sinatra/base'
require 'sinatra/reloader'
require './lib/messages'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages/home' do
    @messages = Messages.all
    erb :'messages/index'
  end

  run! if app_file == $0
end
