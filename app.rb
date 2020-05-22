require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    @peeps = Peep.all
    erb :index
  end
  run! if app_file == $0
end
