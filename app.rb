require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end
  
  get '/view' do
  erb :view
  end

  get '/add' do
  erb :add
  end
  
  post '/add' do
    #code to add 
    redirect '/view'
  end

  run! if app_file == $0
end
