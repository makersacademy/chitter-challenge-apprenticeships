require 'sinatra/base'
require_relative './lib/chitter_messaging'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @content = ChitterMessage.all
    erb :all_messages
  end
  run! if app_file == $0
end
