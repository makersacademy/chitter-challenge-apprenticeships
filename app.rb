require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(params[:test])
    redirect '/peeps'
  end

  get '/send-peeps' do
    erb :send_peeps
  end

  run! if app_file == $0
end
