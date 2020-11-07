require 'sinatra/base'
require_relative 'lib/peeps'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

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

  get '/:id/edit' do
    @peep_id = params[:id]
    erb :'/edit'
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

  delete '/:id' do
    Peeps.delete(id: params[:id])
    redirect '/'
  end

  patch '/:id' do
    Peeps.update(id: params[:id], message: params[:message], date: Time.now.strftime("%Y-%m-%d"))
    redirect '/'
  end

  run! if app_file == $0
end
