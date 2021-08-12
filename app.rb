require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/messages' do
    @messages = ["test1",
                 "test2",
                 "test3"
    ]
    erb :messages
  end 

  run! if app_file == $0
end
