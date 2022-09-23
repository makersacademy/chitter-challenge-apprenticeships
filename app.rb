require "sinatra/base"
require "sinatra/reloader"
require "./lib/peep"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @peeps = Peep.all
    erb(:index)
  end

  post "/post-peep" do
    @peep = Peep.create(params[:new_peep])

    redirect("/")
  end
end
