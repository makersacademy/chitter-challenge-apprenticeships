require 'sinatra/base'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
  
  get '/' do
    redirect '/peeps'
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

  run! if app_file == $0
end
