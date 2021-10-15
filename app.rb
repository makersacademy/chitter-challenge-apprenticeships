require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    messages = ["Message 1 from user 1", "Message 2 from user 2", "Message 3 from user 3"]
  end
  run! if app_file == $0
end
