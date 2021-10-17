require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/peep_dao'

class Chitter < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  enable :sessions

  get '/' do
    @peeps = PeepDao.all
    erb(:index)
  end

  get '/add_peep' do
    erb(:add_peep)
  end

  post '/add_peep' do
    PeepDao.create(Peep.new(params[:message], Time.now))
    redirect "/"
  end

  run! if app_file == $0
end
