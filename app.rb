require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    @filter = session[:filter]
    if @filter.nil?
      erb :peeps
    else
      erb :filtered_peeps
    end
  end

  post '/create-peep' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  post '/filter-peep' do
    @filter = params[:filter]
    session[:filter] = @filter
    redirect '/peeps'
  end

  run! if app_file == $0
end
