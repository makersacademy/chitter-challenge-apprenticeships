require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/Chitter' do
    erb :'chitter/home_page'
  end

  get '/Chitter/add' do
    erb :'chitter/add'
  end

  run! if app_file == $0
end
