require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do 
    'Welcome to Chitter'
  end

  get '/chitter-feed' do
    @peeps = Peep.all
    erb :'chitter-feed/index'
  end

  get '/chitter-feed/new-peep' do
    erb :'chitter-feed/new-peep'
  end

  post '/chitter-feed' do
    Peep.create(message: params[:message])
    redirect '/chitter-feed'
  end
  
  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
