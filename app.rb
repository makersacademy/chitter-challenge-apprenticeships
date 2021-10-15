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
    if params[:message].empty?
      flash[:empty] = "You must enter a message!"
    else
      Peep.create(params[:message])
    end
    redirect('/')
  end

  run! if app_file == $0
end
