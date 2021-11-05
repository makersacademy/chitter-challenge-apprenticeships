require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/messages' do
    erb :messages
  end

  get '/post_message' do 
    erb :post_message
  end

  run! if app_file == $0
end
