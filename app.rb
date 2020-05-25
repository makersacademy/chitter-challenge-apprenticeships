require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end

  get '/view' do
    @chitter = Peeps.all
    erb :'view' 
  end

  get '/add' do 
    erb :'add'
  end

  post '/add_message' do
    Peeps.create(message: params[:message])
    redirect '/view'
  end

  run! if app_file == $0
end
