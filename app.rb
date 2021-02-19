require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/create-peep' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
