require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/peep_dao'

class Chitter < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  get '/' do
    @peeps = PeepDao.all
    erb(:index)
  end

  run! if app_file == $0
end
