require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do 
    @peeps = [
      "This is my first peep",
      "This is my second peep",
      "This is my third peep"
    ]
    erb :peeps
  end 

  run! if app_file == $0
end
