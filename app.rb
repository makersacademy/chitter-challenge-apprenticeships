require 'sinatra/base'
require './lib/message'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb(:index)
  end

  get '/messages' do
    @messages = Message.all
    erb(:messages)
  end

  post '/post-message' do
    result = Message.create(params['post_message'])
    redirect('/messages')
  end

  run! if app_file == $0
end
