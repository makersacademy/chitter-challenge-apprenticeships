require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/message'

class Chitter < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get '/' do
    @header = "Chitter"
    erb :homepage
  end

  get '/messages' do
    @messages = Message.all
    erb :messages
  end

  post '/messages' do
    Message.create(params[:new_message])
    redirect '/messages'
  end

  run! if app_file == $0
end
