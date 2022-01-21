require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
