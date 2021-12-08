require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do 
    @peeps = Peeps.all
    erb :messages
  end 

  get '/posting' do
    erb :post
  end 

  post '/posting' do
    Peeps.create(message: params[:posting])
    redirect '/messages'
  end 

  run! if app_file == $0
end 

# As a Maker
# So that I can see when people are doing things
# I want to see the date the message was posted
