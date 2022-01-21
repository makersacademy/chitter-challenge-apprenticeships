require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messgages = ['Hi there', 'How are you today?']
    erb :'messages/index'
   end

  run! if app_file == $0
end
