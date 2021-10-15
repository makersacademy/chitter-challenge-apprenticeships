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
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end
