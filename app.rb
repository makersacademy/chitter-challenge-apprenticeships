require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
  get '/all_peeps' do
    erb :display
  end
  run! if app_file == $0
end
