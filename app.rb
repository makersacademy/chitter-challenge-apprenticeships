require "sinatra/base"
require "sinatra/reloader"
require "./lib/chitter"

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  get "/peeps" do
    @peeps_all = Chitter.all
    erb :index
  end

  get "/peep/new" do
    erb :"peeps/new"
  end
  post "/peep/new" do
    Chitter.create(message: params[:message])
    redirect "/peeps"
  end
  run! if app_file == $0
end
