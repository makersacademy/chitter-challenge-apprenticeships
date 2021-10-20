require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.add(name: params[:name], message: params[:message], date: params[:date])
    redirect '/peeps'
  end

  post '/peeps/search' do
    session[:search] = params[:search]
    session[:search_results] = Peep.search(search: params[:search])
    redirect '/peeps/search-results'
  end 
  
  # BUG doesn't work
  get '/peeps/search-results' do
    @search_results = session[:search_results]
    erb :'peeps/search-results'
  end

  run! if app_file == $0
end
