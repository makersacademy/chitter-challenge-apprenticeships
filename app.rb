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
    erb :new_peep
  end

  post '/peeps/add' do
    Peep.add(username: params[:username], message: params[:message])
    redirect('/peeps')
  end

  post '/peeps/search' do

    if params[:keyword] == ""
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
      session[:current_user] = User.add(username: params[:username], password: params[:password])
      redirect('/peeps')
    end

    post '/users/logout' do
      session[:current_user] = nil
      redirect('/peeps')
    end

    get '/users/login' do
      erb :user_login

    end

    post '/users/session' do
      p params[:password]
      p params[:username]
      user = User.authenticate(username: params[:username], password: params[:password])
      p "*" * 50
      p user
      p "*" * 50
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

    # def logout
    #   session
    # end

  run! if app_file == $0
end

#
# class Chitter < Sinatra::Base
#   configure :development do
#     register Sinatra::Reloader
#   end
#
#   register Sinatra::Flash
#   enable :sessions, :method_override
#
#   get '/' do
#     redirect('/peeps')
#   end
#
#   get '/test' do
#     'Test page'
#   end
#
#   get '/peeps' do
#     if session[:keyword].nil?
#       @peeps = Peep.reverse(session[:keyword])
#     else
#       @peeps = Peep.reverse
#     end
#     session[:keyword] = nil
#     erb :peeps
#   end
#
#   get '/peeps/new' do
#     erb :new_peep
#   end
#
#   post '/peeps/add' do
#     Peep.add(username: params[:username], message: params[:message])
#     redirect('/peeps')
#   end
#
#   post '/peeps/search' do
#     if params[:keyword] == ""
#       session[:keyword] = "%"
#     else
#     session[:keyword] = "#{params[:keyword]}"
#     end
#     redirect('/peeps')
#   end
#
#   get '/users/new' do
#     erb :new_user
#   end
#
#   post '/users/add' do
#     # session[:current_user] = User.new(username: params[:username], password: params[:password])
#     redirect('/peeps')
#   end
#
#   run! if app_file == $0
# end
