require 'sinatra/base'
# require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/show' do
    p Peep
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0
end
