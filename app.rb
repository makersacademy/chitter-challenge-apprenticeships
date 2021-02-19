require 'sinatra/base'
require_relative './lib/chitter_timeline'

class Chitter < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    @timeline = ChitterTimeline
    erb :index
  end

  post '/' do
    ChitterTimeline.add(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
