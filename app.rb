require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end
  
  post '/peeps' do
    erb(:peeps)
  end
  
  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
