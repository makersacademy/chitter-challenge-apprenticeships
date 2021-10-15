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

  get '/search' do
    erb(:search)
  end

  post '/search' do
    redirect("search/#{params[:query]}")
  end

  get '/search/:query' do
    query = params[:query]
    @peeps = Peep.filter(query)
    erb(:result)
  end

  run! if app_file == $0
end
