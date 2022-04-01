require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter App'
    redirect '/posts/new'
  end
  
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  
  get '/posts/new' do
    erb :new_post
  end

  post '/posts' do
    Post.create(author: params[:author], message: params[:message])
    redirect '/posts'
  end

  run! if app_file == $0
end
