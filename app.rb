require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Message.all
    erb :'peeps/index'
  end

  get '/test' do
    'Test page'
  end

get '/peeps/new' do
  erb :"peeps/new"
end

post '/peeps' do
  message = params['message']
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  redirect '/peeps'
end


  run! if app_file == $0
end
