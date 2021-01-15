require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Hello World!'
  end

  get '/peeps' do
    peeps = [
      'This is a peep!',
      'This is another peep!',
      'And this is also a peep!'
    ]
    peeps.join
  end

  run! if app_file == $0
end
