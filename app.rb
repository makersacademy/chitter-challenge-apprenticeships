require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/messages'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = Messages.messages
    erb :'messages'
  end

  get '/add_message' do
    erb :add_message
  end

  post '/messages' do
    Messages.add(params['add'])
    redirect('/messages')
  end

  run! if app_file == $0
end
