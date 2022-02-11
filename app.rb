require 'sinatra/base'
require './database_connection_setup'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @messages = Message.all
    erb :index
  end

  run! if app_file == $0
end
