require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do 
  	 @peeps = Peep.view_all
  	 erb :'peeps/index'
  end

  post '/peeps' do 
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
