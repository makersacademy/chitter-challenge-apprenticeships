require 'sinatra/base'
require './lib/poop'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/poops' do
    @poops = Poop.all
  end

  run! if app_file == $0
end
