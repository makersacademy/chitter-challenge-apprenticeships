require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'


class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end



  get '/test' do
    'Test page'
  end


  get "/" do 
    "hello"
  end



  get '/messages' do
   @messages = Message.all
   erb :'messages/index'
  end

  run! if app_file == $0
end
