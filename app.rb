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
    @peeps = Peep.all
    erb(:index)
  end

  get "/new" do
    erb(:new)
  end

  post "/" do
    Peep.create(message: params["message"])
    redirect "/"
  end

  run! if app_file == $0
end
