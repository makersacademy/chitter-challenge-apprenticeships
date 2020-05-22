require 'sinatra/base'
require './lib/peeps'
require './lib/db_connection'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end


  get '/' do
    @comments = Peeps.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/message/new' do
    Peeps.create(message: params[:message])
    redirect '/'
  end


  run! if app_file == $0
end
