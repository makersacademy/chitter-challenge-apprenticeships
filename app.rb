require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/filter' do 
    @peeps = Peep.all_with(session[:keyword])
    @keyword = session[:keyword]
    erb(:filter)
  end

  post '/add' do
    Peep.create(msg: params[:new_peep])
    redirect '/'
  end

  post '/filter' do
    session[:keyword] = params[:keyword]
    redirect '/filter'
  end

  run! if app_file == $0
end
