require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
get '/' do
  erb :index
end

get '/all' do
  @peeps = Peeps.all
  erb :outcome
end

  run! if app_file == $0
end
