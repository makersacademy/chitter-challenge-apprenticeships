require 'sinatra/base'
require 'pg'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter away!'
  end

  get '/messages' do
    @message_list = Message.all
    erb :'messages/list'
  end

  get '/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  run! if app_file == $0
end



  # get '/bookmarks/new' do
  #   erb :"bookmarks/add"
  # end

