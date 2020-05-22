require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/all_messages' do
    @peeps = Chitter.all
    erb :'peeps/all_messages'
  end

  run! if app_file == $0
end
