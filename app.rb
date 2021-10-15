require 'sinatra/base'
require 'sinatra/flash'
require './lib/database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  
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
