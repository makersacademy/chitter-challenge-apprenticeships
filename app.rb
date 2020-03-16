require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter World'
  end

  get '/peeps' do 
  	@peeps = Peep.show_all
  	erb :'peeps/index'
  end

  get 'peeps' do 
  	erb :'peeps'
  end

  post '/peeps' do 
    Peep.compose(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
