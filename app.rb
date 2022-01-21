require 'sinatra/base'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all(params[:order])
    erb :index
  end

  post '/new' do
    Peep.create(params[:message])
    redirect '/'
  end
  run! if app_file == $0
end
