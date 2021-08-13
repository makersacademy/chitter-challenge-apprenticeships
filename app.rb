require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    "This is a peep!\n\n
    We're going to build a well!\n
    Noone needs to pay for it- we got you!\n
    Hang on who needs wells these days anyways?"
  end

  run! if app_file == $0
end
