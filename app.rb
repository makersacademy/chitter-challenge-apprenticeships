require 'sinatra/base'
require './lib/cheep'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'here be turtles'

  get '/test' do
    'Test page'
  end

  get '/' do
    redirect '/list'
  end

  get '/list' do
    @filter = session['filter']
    @cheeps = Cheep.list("%#{session['filter']}%")
    session['filter'] = nil
    erb :list
  end

  post '/list' do
    Cheep.add(message: params[:message])
    redirect '/list'
  end

  get '/add' do
    erb :add
  end

  post '/filter' do
    session['filter'] = params[:filter]
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
