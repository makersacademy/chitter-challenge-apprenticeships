require 'sinatra/base'
require './lib/cheep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/list'
  end

  get '/list' do
    @cheeps = Cheep.list
    erb :list
  end

  post '/list' do
    Cheep.add(message: params[:message])
    redirect '/list'
  end

  get '/add' do
    erb :add
  end

  run! if app_file == $PROGRAM_NAME
end
