require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  # get '/' do
    # redirect '/chitter/peeps'
  # end

  get '/chitter/peeps' do
    @peeps = Peeps.all
    erb :'chitter/peeps'
  end

  post '/chitter/peeps' do
    Peeps.create(message: params[:message])
    redirect :'chitter/peeps'
  end

  run! if app_file == $0
end
