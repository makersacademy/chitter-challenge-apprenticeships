require 'sinatra/base'
require_relative './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @all_peeps = Message.all
    erb :index
  end

  get '/peeps/add' do
    erb :message_new
  end

  post '/peeps/new' do
    Message.add(message: params[:message])
    redirect '/peeps'
  end
  run! if app_file == $0
end
