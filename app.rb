require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter away!'
  end

  get '/messages' do
    @message_list = Message.all
    erb :'messages/list'
  end

  run! if app_file == $0
end
