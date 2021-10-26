require "sinatra/base"
require "sinatra/reloader"
require "./lib/peep"

class Chitter < Sinatra::Base
  # configure :development do
  #   register Sinatra::Reloader
  # end

  get "/" do
    "Welcome to Chitter"
  end

  get "/peeps" do
    @peeps = Peep.view
    erb :peeps
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
