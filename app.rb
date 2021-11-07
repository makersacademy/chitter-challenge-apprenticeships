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

  run! if app_file == $0
end
