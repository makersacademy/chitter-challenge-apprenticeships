require 'sinatra/base'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb :homepage
  end

  get '/new' do
    erb :new
  end

  post '/new' do
    Peep.create(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
