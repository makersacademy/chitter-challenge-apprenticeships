require 'sinatra/base'
require '.lib/peeping'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/test' do
    'Test page'
  end
  
  get '/peep' do
    @tweet = Tweet.all
    erb :index
  end

  run! if app_file == $0
end
