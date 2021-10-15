require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = Message.all
    erb:'messages'

  end

  run! if app_file == $0
end

