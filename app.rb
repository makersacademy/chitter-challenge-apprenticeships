require 'sinatra/base'
require_relative './database_connection_setup.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/peep' do
    Peep.create(params[:message])
    redirect '/'
  end

  get '/search' do
    erb :search
  end

  post '/search' do
    session[:keyword] = params[:keyword]
    redirect '/search-results'
  end

  get '/search-results' do
    @search_results = Peep.search(session[:keyword])
    erb :search_results
  end

  run! if app_file == $0
end
