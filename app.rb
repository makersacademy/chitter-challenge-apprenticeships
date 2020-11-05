require 'sinatra/base'
require_relative 'lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  run! if app_file == $0
end
