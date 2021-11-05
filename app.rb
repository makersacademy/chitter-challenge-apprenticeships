require 'sinatra/base'
require_relative './lib/message'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @all_peeps = Message.all
    erb :index
  end

  run! if app_file == $0
end
