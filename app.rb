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
      "This is a peep!",
      "This is also a peep!",
      "This is a third peep!"
    ]

    peeps.join
  end

  run! if app_file == $0
end
