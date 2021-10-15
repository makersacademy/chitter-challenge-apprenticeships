require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'This is a peep!'
  end

  get '/test' do
    'Test page'
  end
  run! if app_file == $0
end
