require 'sinatra/base'
require_relative './lib/little_chits'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @all_chits = Chits.all
    erb(:index)
  end

  run! if app_file == $0
end
