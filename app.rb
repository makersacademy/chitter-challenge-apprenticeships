require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
  get '/' do
    erb :index
  end

  get '/peeps' do
    peeps = [
      "peep1!",
      "peep2!",
      "peep3!"
    ]

    peeps.join
  end

  run! if app_file == $0
end
