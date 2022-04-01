require 'sinatra/base'
require_relative './lib/models/user'
require_relative './lib/models/post'

class Chitter < Sinatra::Base
  # setup sinatra
  set :root,  File.dirname(__dir__)
  set :views, proc { File.join(__dir__, 'lib/views') }
  set :public_folder, proc { File.join(__dir__, 'lib/assets') }

  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    @posts = Post.get_all
    erb :all
  end
end
