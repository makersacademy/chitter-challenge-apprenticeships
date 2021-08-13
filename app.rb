require 'sinatra/base'
 require 'sinatra/reloader'
require './lib/messages.rb'
class Chitter < Sinatra::Base
  configure :development do
  register Sinatra::Reloader
end
  get '/test' do
    'Test page'
  end

  get '/' do
    @messages = Messages.all
    erb :screen1
  end
 
  post '/' do
    #p params[:post]
    Messages.create(post: params[:post])
    #p 'before messages'
    redirect '/'
  end 

  run! if app_file == $0
end
