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

  get '/' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/' do
    Peep.create(message: params[:peep], date: params[:date])
    redirect '/'
  end

  get '/newpeep' do
    erb :newpeep
  end

  get '/findpeep' do
    erb :findpeep
  end

  post '/filteredpeeps' do
    @filteredpeeps = Peep.find(params[:peep])
    erb :filtered
  end

  run! if app_file == $0
end
