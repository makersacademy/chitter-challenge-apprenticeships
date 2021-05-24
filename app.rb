require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/peep'


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params['message'])
    redirect '/peeps'
  end

  get '/peeps/find' do
    @search = Peep.find(params['keyword'])
    erb :'peeps/find'
  end

  run! if app_file == $0
end
