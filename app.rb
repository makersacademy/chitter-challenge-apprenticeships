require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    erb (:index)
  end

  get '/peep_show' do
    @peeps = Peep.all
    erb (:peep_show)
  end

  get '/add_peep' do
    erb (:post_peep)
  end

  post '/message' do
    Peep.add(message: params[:message])
    redirect '/peep_show'
  end

  run! if app_file == $0
end
