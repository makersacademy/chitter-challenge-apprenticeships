require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base
 
  get '/test' do
    'Test page'
  end

  get '/view_messages' do
    @messages = Messages.all
    erb :'messages/index'
  end

  run! if app_file == $0
end
