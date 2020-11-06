require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'Here be Dragons'

  get '/Chitter' do
    @peeps = Peep.all
    erb :'chitter/home_page'
  end

  post '/Chitter/add' do
    Peep.create(peep: params[:peep], time: "#{Time.now.day}/#{Time.now.month}/#{Time.now.year}")
    redirect '/Chitter'
  end

  run! if app_file == $0
end
