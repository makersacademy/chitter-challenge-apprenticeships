require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get '/homepage' do
    @header = "Chitter"
    erb :homepage
  end

  get '/messages' do
    @messages = ["Today's first message", 
    "Today's second message", 
    "Today's third message"]
    erb :messages
  end

  run! if app_file == $0
end
