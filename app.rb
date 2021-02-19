require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end
  
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
  
  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end
  run! if app_file == $0
end
