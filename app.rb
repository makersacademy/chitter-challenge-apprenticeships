require 'sinatra/base'
require './lib/peeps'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
  end
  get '/' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/add' do
    erb :peep_post
  end

  post '/add' do
    Peeps.create(message: params[:message])
    redirect '/'
  end


  run! if app_file == $0
end
