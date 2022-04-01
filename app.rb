require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter'
  end

  get '/chitter' do
      @peeps = Peep.all
      erb :'chitter'
  end

  run! if app_file == $0
end
