require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @messages = [
      "This is a peep!"
    ]
    erb :index
  end

  run! if app_file == $0
end
