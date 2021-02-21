require 'sinatra/base'
require 'pg'
require_relative './lib/user'
require_relative './lib/peeps_manager'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:sign_in)
  end

  post '/sign_in_conf' do
    @user = User.new(params[:name], params[:password])
    session[:user] = @user 
    erb(:welcome)
  end

  get '/links_page' do
    @user = session[:user]
    # connection = PG.connect(dbname: 'chitter')
    # connection.exec("INSERT INTO users (name, password) VALUES('#{@user.name}', '#{@user.password}')")
    erb(:links)
  end

  get '/peeps' do
    @peeps = PeepsManager.all
    erb(:all_peeps)
  end

  get '/create_peep' do
    erb(:create_peep)
  end

  post '/peeps' do
    #peep = Peep.new(params[:message], session[:user])
    PeepsManager.create(params[:message])
    redirect('/peeps')
  end
  run! if app_file == $0
end
