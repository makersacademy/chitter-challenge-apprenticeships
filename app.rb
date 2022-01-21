require 'sinatra/base'
require_relative 'lib/peep'
require_relative 'lib/database_connection'

DatabaseConnection.setup

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(params[:order], params[:keyword])
    erb :index
  end

  post '/new' do
    Peep.create(params[:message])
    redirect '/'
  end
  run! if app_file == $0
end
