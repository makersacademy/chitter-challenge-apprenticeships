require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'


class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    erb:'index'
  end

  get '/peep' do
  peeps = 
    [
      "this is my first peep!",
      "this is my second peep!",
      "this is my third peep!"
    ]
    end

  run! if app_file == $0
end
