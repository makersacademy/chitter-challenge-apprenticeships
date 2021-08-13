require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter Home'
  end

  get '/peeps' do
    @peeps = Peep.all
    
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
