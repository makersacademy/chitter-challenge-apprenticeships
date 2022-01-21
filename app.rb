require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    if params[:keyword] == nil
      @peeps = Peep.all
    else
      @peeps = Peep.filtered(params[:keyword])
    end
    erb :index
  end

  post '/peeps' do
    Peep.create(params[:peep])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  run! if app_file == $0
end
