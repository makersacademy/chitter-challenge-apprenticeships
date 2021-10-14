require 'sinatra/base'
require './lib/database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/new' do
    Peep.create(params[:message])
    redirect('/')
  end

  run! if app_file == $0
end
