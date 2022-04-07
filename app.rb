require 'sinatra/base'
require './lib/messages'
require './lib/database_connection'
require './spec/db_setup_helper'

class Chitter < Sinatra::Base
  enable :sessions
  configure do
    enable :reloader
  end 

  get '/newuser' do 
    erb :'users/new'
  end

  post '/newuser' do
    @user = User.create(params[:email], params[:password])
    session["email"] = params[:email]
    redirect '/chitter'
  end

  get '/chitter' do 
    @email = session["email"]
    erb :index
  end

  get '/peeps' do
    @messages = Messages.all
    erb :allpeeps
  end 

  get '/drafts' do
    erb :post
  end

  post '/postpeep' do 
    peep = params['message']
    Messages.create(message: peep)
    redirect('/chitter')
  end

  run! if app_file == $0
end
