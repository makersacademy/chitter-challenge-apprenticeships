require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = [
      "I've got blisters on me fingers!",
      "Oh, dress yourself, my urchin one, for I hear them on the rails"
    ]
    erb :'peeps/index'
  end

  get '/new' do
  end

  run! if app_file == $0
end
