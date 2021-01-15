require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Hello World!'
  end

  run! if app_file == $0
end
