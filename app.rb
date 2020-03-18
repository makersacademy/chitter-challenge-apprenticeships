require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end

  get '/all' do
  @peep = Peeps.all
  erb :peeps_outcome
  end

  post '/all' do
  Peeps.create(message: params[:message])
  redirect '/all'
end



  # get '/signup' do
  #   erb :signup
  # end
  #
  # post '/signup' do
  #   user = User.create( email: params['email'],
  #         password: params['password'],
  #         username: params['username'] )
  #   session[:user_id] = user.id
  #   redirect '/'
  #  end


  run! if app_file == $0
end
