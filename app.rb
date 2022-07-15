require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/messages' do
    p "________"
    p params
    p "________"
    @message = params[:message]
    redirect '/messages'
  end

  get '/messages' do
    
    erb :messages
  end

  run! if app_file == $0
end
