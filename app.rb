require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Testing testing'
  end

  run! if app_file == $0
end
