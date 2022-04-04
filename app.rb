require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    Chitter.add
    erb: "index"
  end


  run! if app_file == $0
end
