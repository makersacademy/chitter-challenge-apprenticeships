require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb(:board)
  end

  run! if app_file == $0
end
