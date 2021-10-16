require "sinatra/base"
require "sinatra/reloader"
require_relative "./lib/peep"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/test" do
    "Test page"
  end

  get "/" do
    erb :index
  end

  get "/peeps/all" do
    @peeps = Peep.all
    erb :"peeps/all"
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps/add" do
    Peep.add(message: params[:message], datetime: params[:datetime])
    redirect to ("/peeps/all")
  end

  get "/peeps/order" do
    @peeps_sorted = Peep.sort
    erb :"peeps/order"
  end

  run! if app_file == $0
end
