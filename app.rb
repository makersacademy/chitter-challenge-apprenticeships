require "sinatra/base"
require "sinatra/reloader"
require_relative "lib/peep"
require "./db_connection_setup"

class Chitter < Sinatra::Base
  get "/" do
    @peeps = Peep.all
    erb :index
  end

  post "/peep" do
    Peep.create(message: params[:message])
    redirect "/"
  end

  post "/peep/matches" do
    @keyword = params[:search_field]
    @filtered_peeps = Peep.filter(keyword: @keyword)
    erb :filter_matches
  end

  run! if app_file == $0
end
