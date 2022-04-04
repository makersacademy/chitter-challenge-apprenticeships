require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Messages.all
    erb :index
  end 

  get '/peeps/new' do
    erb :newpeep
  end 

  post'/peeps' do
    # erb :'newpeep'
    message = params["message"]
    Messages.create(message)
    redirect '/peeps'
  end 

  run! if app_file == $0
end