require 'sinatra/base'
require './database_connection_setup'
require './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @messages = Message.all
    erb :index
  end

  get '/by_latest' do
    @messages = Message.latest
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/peep' do
    Message.create(params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
