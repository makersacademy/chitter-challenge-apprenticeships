require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/test' do
    'Test page'
  end

  get '/messageboard' do
    @messages = Message.all
    erb :messageboard
  end

  get '/messageboard/new' do
    erb :"messageboard/new"
  end

  post '/messageboard' do
    Message.create(name: params[:Name], message: params[:Message])
    redirect '/messageboard'
  end

  delete '/messageboard/:id' do
    Message.delete(id: params[:id])
    redirect '/messageboard'
  end

  get '/messageboard/:id/edit' do
    @message = Message.find(id: params[:id])
    erb :'messageboard/edit'
  end

  patch '/messageboard/:id' do
    Message.update(id: params[:id], name: params[:Name], message: params[:Message])
    redirect '/messageboard'
  end

  run! if app_file == $0
end
