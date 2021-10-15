require 'sinatra/base'
require_relative './lib/chitter_messaging'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @content = ChitterMessage.all
    erb :all_messages
  end

  get '/messages/new' do
    erb :"/messages/new"
  end

  post '/messages' do
    ChitterMessage.post(message: params[:message])
    redirect '/messages'
  end

  run! if app_file == $0
end
