require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Chitter TEST AGAIN" 
  end
  
  get '/peeps' do
    "Hello, this is a new peep!"
  end
  
  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
