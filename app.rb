require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messageboard' do
    p ENV
    @messages = Message.all
    erb :messageboard
  end

  run! if app_file == $0
end
