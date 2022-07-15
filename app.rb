require 'sinatra/base'
require 'peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/posts' do
    @posts = ["This is my first post!"]
    erb(:'posts/index')
  end

  run! if app_file == $0
end
