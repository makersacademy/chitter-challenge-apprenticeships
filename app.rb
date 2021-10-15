require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/chitter'
  end

  run! if app_file == $0
end
