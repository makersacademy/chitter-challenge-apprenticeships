require 'sinatra/base'
require 'pg'
require './lib/messages'

class Chitter < Sinatra::Base

  get '/messages' do
    @messages = Messages.all
    erb :messages
  end

  post '/messages' do
    @peep = params[:peep]
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message) VALUES('#{@peep}')")
    redirect '/messages'
  end

  get '/post_message' do 
    erb :post_message
  end

  run! if app_file == $0
end
