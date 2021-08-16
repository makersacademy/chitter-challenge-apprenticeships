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
  
  get '/add_peep' do
    erb :add_peep
  end
  
  post '/add_peep' do
    Peep.add(params[:peep_box])
    redirect '/'
  end

  run! if app_file == $0
end
