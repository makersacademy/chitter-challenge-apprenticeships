require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    filter_tag = session[:filter]
    @peeps = Message.all(filter: filter_tag)
    erb(:board)
  end

  post '/peep/new' do
    Message.create(message: params[:peep])
    redirect '/'
  end

  post '/peep/filter' do
    session[:filter] = params[:filter]
    redirect '/'
  end
  
  run! if app_file == $0
end
