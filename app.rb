require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/messages' do
    erb :messages
  end

  run! if app_file == $0
end
