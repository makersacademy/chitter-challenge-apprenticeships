require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    p @peeps
    erb :'index' 
  end





  run! if app_file == $0
end
