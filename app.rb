require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
end
