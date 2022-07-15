require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get '/' do 
     "Welcome to Chitter! It's like Twitter, but with Ch :P"
  end


  get '/homepage' do
      @peep_posts = ["look at my new car!",
                    "Check out my new puppy!",
                    "Look at the sky today!"]
      erb :'homepage/index'
    end














  run! if app_file == $0
end
