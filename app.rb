# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

# class to pass params from forms to SQL
class MessageManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :post_message
  end

  post '/messages' do
    @name = params[:name]
    @message = params[:message]
    @new_message = Message.new
    @time = Time.now
    @new_message.post(@name, @message, @time)
    @messages = Message.all
    erb :index
  end

  post '/filtered' do
    @filter = params[:filter]
    @new_message = Message.new # is this wrong ????? does this make a whole new empty message ?
    @messages = Message.filter(@filter)
    erb :index
  end

  get '/messages' do
    @messages = Message.all
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
