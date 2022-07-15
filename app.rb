require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    "Testing testing"
  end

  get '/view_peeps' do
    @peeps = [
          "This is a peep!",
          "So is this!",
          "Also this!"
    ]
    erb :view_peeps
  end

  run! if app_file == $0
end
