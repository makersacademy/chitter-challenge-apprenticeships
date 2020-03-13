require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter homepage'
  end

  get '/peeps' do
    @peeps = [
      "I am a peep!",
      "I am another peep!"
    ]
  end

  erb :'peeps/index'

  run! if app_file == $0
end
