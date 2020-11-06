require 'sinatra/base'
require 'cheep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/list'
  end

  get '/list' do
    @data = Cheep.list
    erb :list
  end

  post '/list' do
    redirect '/list'
  end

  get '/add' do
    erb :add
  end

  run! if app_file == $PROGRAM_NAME
end
