require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, "here be dragons"

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/add' do
    erb :'peeps/add'
  end

  post '/peeps' do
    Peep.add(peep: params[:peep], time: Time.now)
    redirect '/peeps'
  end

  run! if app_file == $0
end
