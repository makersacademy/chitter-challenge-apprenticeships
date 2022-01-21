require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    "Chitter"
  end

#   As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

  get '/peeps' do
    @peeps = [
      "This is my first peep",
      "This is my second peep",
      "This is my third peep"
    ]
  
    erb :index
  end

  run! if app_file == $0
end
