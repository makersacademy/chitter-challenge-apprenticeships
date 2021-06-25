require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peeps.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps/matches' do
    @filter = Peeps.filter(params[:filter])
    erb :'peeps/filter'
  end

  run! if app_file == $0
end
