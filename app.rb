require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/newsfeed' do
    @peeps = Peep.all
    erb(:newsfeed)
  end

  post '/newsfeed' do
    Peep.create(params['message'])
    redirect '/newsfeed'
  end

  get '/newsfeed/filter' do
    @peeps = Peep.all
    erb(:filter)
  end

  post '/newsfeed/filter' do
    @peeps = Peep.filter(params['filter'])
    erb(:filter)
  end

  run! if app_file == $0
end
