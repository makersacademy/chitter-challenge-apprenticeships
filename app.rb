require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/' do
    Peep.write(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
