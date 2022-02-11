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

  run! if app_file == $0
end
