require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require_relative './lib/peep'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader 
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do 
    @peeps = Peep.chronological
    erb(:index)
  end

  get '/peeps/new' do 
    erb(:new)
  end

  post '/peeps' do
    Peep.create(params['message'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
