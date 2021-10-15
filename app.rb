require "sinatra"
require "sinatra/base"
require "./lib/peep"

class Chitter < Sinatra::Base
  get "/test" do
    "Test page"
  end

  get "/view" do
    @peeps = Peeps.view
    erb(:view)
  end

  get "/add" do
    erb(:add)
  end

  post "/create" do
    Peeps.add(params[:message])
    redirect "view"
  end

  run! if app_file == $0
end
