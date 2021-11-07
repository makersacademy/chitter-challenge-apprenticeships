require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/home' do
    @messages = Message.all 
    erb :index
  end

  post '/new_post' do
    Message.make(message: params[:message])
    redirect '/home'
  end

  post '/sort' do
    @messages = Message.sort
    erb :index
  end

  post '/restore' do
    redirect '/home'
  end

  post '/filter' do
    @messages = Message.filter(keyword: params[:filter])
    erb :index
  end

  run! if app_file == $0
end
