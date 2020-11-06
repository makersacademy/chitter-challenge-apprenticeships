require 'sinatra/base'
require_relative './lib/databasequery'
require_relative './lib/chittermanager'
require 'Time'

class Chitter < Sinatra::Base
  get '/home' do
    @chirps = ChitterManager.all
    @time = Time.new
    erb :index
  end

  get '/' do 
    ENV['ENVIRONMENT'].nil? ? DatabaseQuery.setup('chitter') : DatabaseQuery.setup('chitter_test')
    redirect '/home'
  end

  post '/add-chirp' do 
    ChitterManager.add(params[:content], params[:author])
    redirect '/home'
  end

  run! if app_file == $0
end
