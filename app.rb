require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep.rb'

class Chitter < Sinatra::Base
  
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/add-peep' do
    Peep.add(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    p @peeps
    erb :peeps
  end

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
