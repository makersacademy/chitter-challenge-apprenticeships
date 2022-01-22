require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

# add check when search returns empty

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  enable :sessions

  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/new' do
    erb :new
  end 

  get '/search' do
    erb :search
  end 

  get '/search_result' do
    @keyword = session[:keyword]
    @messages = Message.search(search: @keyword)
    p @keyword
    erb :search_result
  end 

  get '/sorted' do
    @messages = Message.sort
    erb :sorted
  end 

  post '/search' do
    # p params
    session[:keyword] = params[:keyword]
    redirect '/search_result'
  end

  post '/' do
    p params
    Message.create(message: params[:message])
    redirect '/'
  end

  

  run! if app_file == $0
end
