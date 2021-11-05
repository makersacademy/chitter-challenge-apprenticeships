require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/index' do
    'First Message'
  end

  run! if app_file == $0
end
