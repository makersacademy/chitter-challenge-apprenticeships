require 'sinatra/base'
require_relative './model/message_handler'

class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/message_page' do 
    @result = Message_handler.all
    erb :message_page
  end 

  get '/add' do
    erb :add
  end 

  post '/add_entry' do 
    Message_handler.add(message: params[:message])
    redirect 'message_page'
  end 

  run! if app_file == $0
end
