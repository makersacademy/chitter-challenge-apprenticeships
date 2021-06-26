require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = [
      'First peep!',
      'Another peep!',
      'One more peep!'
    ]
    erb :peeps
  end

  run! if app_file == $0
end
