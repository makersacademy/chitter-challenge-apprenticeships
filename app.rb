require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  
  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter'
  end 

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/chitter' do
    Peep.create(message: params[:message])
    redirect '/chitter'
  end

  run! if app_file == $0
end 
