require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    "Chitter"
  end

  get '/peeps' do
    @peeps = [
      "This is my first peep",
      "This is my second peep",
      "This is my third peep"
    ]
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    p "Peep"
  end

  run! if app_file == $0
end
