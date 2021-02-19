require 'sinatra/base'
require_relative './lib/chitter_timeline'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @timeline = ChitterTimeline
    erb :index
  end

  run! if app_file == $0
end
