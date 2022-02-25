require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/peeps' do
    Peep.add(username: params[:peep_user], message: params[:peep_message])
    redirect '/peeps'
  end

  post '/peeps/search' do
    session[:keyword] = params[:search_keyword]
    redirect '/peeps/results'
  end

  get '/peeps/results' do
    @search = Peep.search(session[:keyword])
    @keyword = session[:keyword]
    erb(:results)
  end

  run! if app_file == $0
end
