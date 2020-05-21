require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    Chits.new.chits
  end

  get '/chitter' do
    @chitter.all
  end



  run! if app_file == $0
end
