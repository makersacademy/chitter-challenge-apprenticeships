require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :index
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
