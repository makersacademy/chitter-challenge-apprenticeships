require 'sinatra/base'
require 'sinatra/reloader'


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
   messages = 'This is a peep!'
  end

  run! if app_file == $0
end
