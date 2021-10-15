require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require 'pg'

class ChitterController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/view-peeps' do #home/root
    @message = ChitterModel.all
    erb :'peeps/index'
  end

  get '/add-peeps' do
    erb :'peeps/add-peep'
  end

  post '/add-peeps/new' do
    ChitterModel.add_peeps(message: params[:message])
    redirect '/view-peeps'
  end

  delete 'delete-peep/:id' do
    redirect '/view-peeps'
  end

  run! if app_file == $0
end
