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

  post '/peep' do
    Peep.create(peep: params[:message])
    redirect '/'
  end
  
  post '/filter' do
    @peeps = Peep.filter(filter: params[:filter])
    erb :index
  end

  run! if app_file == $0
end
