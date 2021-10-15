require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    
  end

  get '/peeps' do
    peeps = [
      'message 1',
      'message 2',
      'message 3'
    ]
    peeps.join
  end

  run! if app_file == $0
end
