require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base
  get '/' do
    'My Chitter App'
  end

  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = Message.all
    erb :index
  end

  run! if app_file == $0
end
