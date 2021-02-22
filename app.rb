require 'sinatra/base'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    @timeline = Peeps
    erb :index
  end

  post '/' do
    Peeps.add(peep: params[:peep])
    redirect '/'
  end

  post '/search' do
    session[:search] = params[:search]
    redirect '/search_result'
  end

  get '/search_result' do
    @results = Peeps
    @query = session[:search]
    erb :search_result
  end

  run! if app_file == $0
end
