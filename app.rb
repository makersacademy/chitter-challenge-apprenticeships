require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
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
    name = params["Name"]
    message = params["Message"]
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (name, message) VALUES ('#{name}', '#{message}');")
    redirect '/messageboard'
  end

  run! if app_file == $0
end
