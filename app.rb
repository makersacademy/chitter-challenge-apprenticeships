require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb :timeline
  end

  run! if app_file == $0
end
