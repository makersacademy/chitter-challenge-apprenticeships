require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end 

  run! if app_file == $0
end
