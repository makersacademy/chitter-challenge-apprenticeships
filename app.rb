require 'sinatra/base'
require './lib/chitter.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @chitters = Peeps.all
    erb :index
  end

  run! if app_file == $0
end
