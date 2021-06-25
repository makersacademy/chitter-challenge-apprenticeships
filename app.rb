require "sinatra/base"
require "sinatra/reloader"
require "./lib/chitter"
require "./lib/user"
require "sinatra/flash"

class ChitterManager < Sinatra::Base
  register Sinatra::Reloader
  register Sinatra::Flash
  enable :session

  get "/peeps" do
    @peeps_all = Chitter.all
    erb :index
  end

  post "/peep/new" do
    Chitter.create(message: params[:message])
    redirect "/peeps"
  end

  get "/users/new" do
    erb :"users/new"
  end
  post "/users" do
    user_id = session[:user_id]
    user = User.create(email: params["email"], password: params["password"])
    redirect "/peeps"
  end

  get "/" do
    redirect("/sessions/new")
  end
  # sign in
  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect("/peeps")
    else
      flash[:notice] = "Please check your email or password."
      redirect("/sessions/new")
    end
    post "/sessions/destroy" do
      session.clear
      flash[:notice] = "You have signed out."
      redirect("/peeps")
    end
  end
  run! if app_file == $0
end
