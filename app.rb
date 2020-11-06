require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'Here be Dragons'

  get '/Chitter' do
    @name = session[:name]
    @peep = session[:peep]
    erb :'chitter/home_page'
  end

  post '/Chitter/add' do
    session[:name] = params[:name]
    session[:peep] = params[:peep]
    redirect '/Chitter'
  end

  run! if app_file == $0
end
