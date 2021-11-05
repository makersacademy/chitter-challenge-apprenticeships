require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    # @messages = [
    #   "I am a frog"
    # ]
    @messages = Message.all
    erb :'/messages/index'
  end

  run! if app_file == $0
end
