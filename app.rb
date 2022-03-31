require 'sinatra/base'
require './lib/post'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter App'
  end
  
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  run! if app_file == $0
end
