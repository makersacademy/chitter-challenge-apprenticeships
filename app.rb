require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

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

  run! if app_file == $0
end
