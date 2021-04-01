require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do 
    erb :new
  end

  post '/peeps' do 
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
