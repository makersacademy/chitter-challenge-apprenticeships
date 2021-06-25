require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  post '/addpeep' do
    peep = params[:add_peep]
    Peeps.add(peep)
    redirect '/'
  end

  run! if app_file == $0
end
