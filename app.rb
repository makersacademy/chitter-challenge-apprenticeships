require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Peep Manager'
  end

  run! if app_file == $0
end
