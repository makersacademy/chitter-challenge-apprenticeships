require "sinatra/base"
require "sinatra/reloader"
require "sinatra/flash"
require "./database_connection_setup"
require "uri"
require "./lib/peep"
require "./lib/user"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash
  enable :sessions, :method_override

  get '/' do
    redirect('/peeps')
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @user = session[:current_user] if logged_in?
    # Logic tree for keyword search
    if !session[:keyword].nil?
      @peeps = Peep.reverse(session[:keyword])
    else
      @peeps = Peep.reverse
    end
    session[:keyword] = nil
    erb :peeps
  end

  get '/peeps/new' do
    if logged_in?
      @user = session[:current_user]
      erb :new_peep
    else
      redirect('/users/new')
    end
  end

  post '/peeps/add' do
    Peep.add(username: params[:username], message: params[:message])
    redirect('/peeps')
  end

  post '/peeps/search' do
    if params[:keyword].empty?
      session[:keyword] = "%"
    else
    session[:keyword] = "#{params[:keyword]}"
    end

    redirect('/peeps')
  end

    get '/users/new' do
      erb :user_signup
    end

    post '/users/add' do
      if User.validate?(username: params[:username])
        flash[:notice] = "An account already exists with that username"
        redirect('/users/new')
      elsif
        !params[:username].empty? && !params[:password].empty?
        session[:current_user] = User.add(username: params[:username], password: params[:password])
        redirect('/peeps')
      else
        flash[:notice] = "Field cannot be empty, please try again"
        redirect('/users/new')
      end
    end

    post '/users/logout' do
      session[:current_user] = nil
      redirect('/peeps')
    end

    get '/users/login' do
      erb :user_login

    end

    post '/users/session' do
      user = User.authenticate(username: params[:username], password: params[:password])
      if user
        session[:current_user] = user
        redirect('/peeps')
      else
        flash[:notice] = "Sorry something went wrong, please check your username and password and try again"
        redirect('users/login')
      end
    end

    def logged_in?
      !session[:current_user].nil?
    end


  run! if app_file == $0
end
