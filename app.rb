require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Peep Manager'
  end

  get '/peeps' do
    peeps = [
      'This is a peep!',
      'I saw a panda!'
    ]
  end

  run! if app_file == $0
end
