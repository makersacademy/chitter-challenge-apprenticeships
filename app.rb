require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    erb :'index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  get '/new' do
    erb :'new'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
