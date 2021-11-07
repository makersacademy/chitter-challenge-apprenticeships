require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @peeps = [
      "This is peep 1",
      "This is peep 2",
      "This is peep 3"
     ]
    erb :'chitter/index'
  end
  run! if app_file == $0
end
