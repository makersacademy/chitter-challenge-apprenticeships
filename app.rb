require 'sinatra/base'
require_relative './model/message_handler'

class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/message_page' do 
    @result = MessageHandler.all
    erb :message_page
  end 

  get '/add' do
    erb :add
  end 

  post '/add_entry' do 
    MessageHandler.add(message: params[:message])
    redirect 'message_page'
  end 

  get '/filter' do 
    erb :filter
  end 

  post '/filter_reset' do 
    redirect '/message_page'
  end 

  get '/message_page/filter' do 
    @result = MessageHandler.all_filtered(filter: params[:filter])
    erb :message_page
  end

  run! if app_file == $0
end
