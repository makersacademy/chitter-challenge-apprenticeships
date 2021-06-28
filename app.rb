require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/addpeep' do
    peep = params[:add_peep]
    Peeps.add(peep)
    redirect '/'
  end

  post '/search' do
    session[:query] = params[:search]
    redirect '/filter'
  end

  get '/filter' do
    @peeps = Peeps.search(session[:query])
    erb :filter
  end

  run! if app_file == $0
end
