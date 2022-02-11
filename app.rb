require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messageboard' do
    'Welcome to the Chitter Channel'
  end

  run! if app_file == $0
end
