require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    "Testing testing"
  end

  get '/' do
    @peeps = [
          "This is a peep!",
          "So is this!",
          "Also this!"
    ]
    erb :index
  end

  run! if app_file == $0
end
