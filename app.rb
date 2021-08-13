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

  get '/filter' do
   erb :screen2
  end

  post '/filter' do
    p params
    filter = params["filter"]
    @messages = Messages.filter(filter)
    erb :screen3
  end

  run! if app_file == $0
end
