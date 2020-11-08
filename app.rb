require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = Message.list
    erb :view_messages
  end

  run! if app_file == $0
end
