require 'sinatra/base'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    @timeline = Peeps
    erb :index
  end

  post '/' do
    Peeps.add(peep: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
