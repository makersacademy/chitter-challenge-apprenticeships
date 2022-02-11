require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do

  end

  run! if app_file == $0
end
