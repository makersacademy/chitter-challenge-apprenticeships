require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter App'
    erb :index
  end
  
  get '/posts' do
    @posts = Post.all
    erb :see_posts
  end
  
  get '/posts/new' do
    erb :new_post
  end

  post '/posts' do
    Post.create(date: params[:date], author: params[:author], message: params[:message])
    redirect '/posts'
  end

  run! if app_file == $0
end
