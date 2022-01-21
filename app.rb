require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Message.all
    erb(:board)
  end

  run! if app_file == $0
end
