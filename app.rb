require "sinatra/base"
require "sinatra/reloader"
require "./lib/peep"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/test" do
    "Test page"
  end

  get "/" do
    erb :"peeps/index"
  end

  post "/continue" do
    redirect("/peeps")
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/peeps"
  end

  post "/go" do
    redirect("/peeps/new")
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps" do
    Peep.post(message: params[:message])
    redirect "/peeps"
  end

  run! if app_file == $0
end
