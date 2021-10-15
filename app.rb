require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    erb:'index'
  end

  get '/messages' do
    p ENV
    
    @messages = Message.all
    erb:'messages'

  end

  run! if app_file == $0
end

