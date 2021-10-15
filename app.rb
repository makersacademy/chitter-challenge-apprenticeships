require 'sinatra/base'
require "sinatra/reloader"
require './lib/poop'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :method_override

  get '/test' do
    'Test page'
  end

  get '/poops' do
    @poops = Poop.all
    erb :'poops/index'
  end

  get '/poops/new' do
    erb :'poops/new'
  end

  post '/poops' do
    Poop.create(params[:message])
    redirect '/poops'
  end

  run! if app_file == $0
end
