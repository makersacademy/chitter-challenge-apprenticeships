# CONTROLLER
# Get data from the model and put it in the view

require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
  get '/index' do
    erb :index
  end

  get '/peeps' do
    p ENV

    @messages = Message.all
    erb :peeps
  end

  get '/message/new' do
    erb :"/message/new"
  end

  post '/peeps' do
    Message.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
