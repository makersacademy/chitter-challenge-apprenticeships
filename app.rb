require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = ['This is the second peep!', 'This is the first peep!']
    erb(:board)
  end

  run! if app_file == $0
end
