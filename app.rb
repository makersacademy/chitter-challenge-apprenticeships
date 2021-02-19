require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :view
  end

  post '/create_peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  run! if app_file == $0
end
