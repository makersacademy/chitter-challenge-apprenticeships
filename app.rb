require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    "Chitter"
  end
  
  
  
  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
