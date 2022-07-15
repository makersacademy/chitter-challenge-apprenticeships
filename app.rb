require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/messages' do
    session[:message] = params[:message]
    redirect '/messages'
  end

  get '/messages' do
    @message = session[:message]
    erb :messages
  end

  run! if app_file == $0
end
