require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/home' do
    @peep = Peep.all
    erb :home
  end

  run! if app_file == $0
end
