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
    p params[:timestamp]
    Peeps.add(params[:message], params[:timestamp])
    redirect "/view"
  end

  get "/times" do
    @peep_time = Peeps.date
    erb(:times)
  end

  run! if app_file == $0
end
