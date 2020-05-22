require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    "Homepage"
  end

  get '/chitter' do
    @chits = Chits.peeps
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end


  post '/chitter' do
    message = params['message']
    Chits.create(message: message)
    redirect '/chitter'
  end

  get '/chitter/find' do
    erb :'chitter/find'
  end

  post '/chitter/result' do
    message = params['message']
   @chits = Chits.find(message: message)
   erb :'chitter/result'
 end





  run! if app_file == $0
end
