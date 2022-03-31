require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter!'
    erb :index
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end
  
  post '/peeps' do
    Peeps.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
