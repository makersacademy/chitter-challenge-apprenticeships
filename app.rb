require 'sinatra/base'
require_relative 'lib/peeps'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  get '/filter' do
    erb :filter
  end

  post '/' do
    message = params[:message]
    Peeps.add(message)
    redirect '/'
  end

  post '/filter' do
    keyword = params[:keyword]
    @filtered_peeps = Peeps.filter(keyword)
    erb :results
  end

  run! if app_file == $0
end
