require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  get '/test' do
    'Test page'
  end

  get '/all-messages' do
    
    @all_peeps = [
                 "peep 1",
                 "peep 2",
                 "peep 3"]
    erb :'peeps/index'

  end   

  run! if app_file == $0
end
