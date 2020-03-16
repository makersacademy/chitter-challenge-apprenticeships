require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Peep.all
    erb :index
  end

  post '/post' do
    Peep.post(message: params['message'])
    redirect '/'
  end

  post '/filter' do
    @filter = params['filter']
    Peep.filter(filter: @filter)
    redirect '/filter'
  end

  get '/filter' do
    erb :filter
  end

  run! if app_file == $0
end
