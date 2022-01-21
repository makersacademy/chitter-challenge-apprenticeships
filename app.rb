require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    filter = session[:filter]
    if filter.nil? || filter.empty?
      @peeps = Message.all
    else
      @peeps = Message.filter_by(tag: filter)
    end
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
