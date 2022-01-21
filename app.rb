require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/new-peep' do
    Peep.add(username: params[:peep_user], message: params[:peep_message])
    redirect '/'
  end

  post '/search' do
    session[:keyword] = params[:search_keyword]
    redirect '/results'
  end

  get '/results' do
    @search = Peep.search(session[:keyword])
    erb(:results)
  end

  run! if app_file == $0
end
