require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messageboard' do
    erb :messageboard
  end

  get '/chatter' do
    erb :chatter
  end

  run! if app_file == $0
end
