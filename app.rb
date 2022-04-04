require 'sinatra/base'
require './lib/peep'
class Chitter < Sinatra::Base
  
  get '/' do
    'Chitter'
  end
  
  get '/peeps' do 
    @peeps = Peep.all
    erb :'index'
  end

  get '/peeps/new' do
    erb :"new"
  end

  post '/peeps' do 
    Peep.add(message: params[:peep], username: params[:username], posted_at: params[:posted_at])
    redirect '/peeps'
  end

  run! if app_file == $0
end
