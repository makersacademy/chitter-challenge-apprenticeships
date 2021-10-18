require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    erb :chitter
  end

  get '/post-a-peep' do
    erb :post_a_peep
  end

  run! if app_file == $0
end
