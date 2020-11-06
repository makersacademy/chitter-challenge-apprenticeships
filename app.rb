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

  get '/new' do
    erb :add
  end

  post '/success' do
    new_peep = params[:new_peep]
    Peep.add(new_peep)
    erb :confirmation
  end

  run! if app_file == $0
end
