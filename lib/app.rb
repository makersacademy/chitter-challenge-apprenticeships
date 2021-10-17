require "sinatra/base"
require "sinatra/reloader"
require_relative "./peep"
require_relative "../database_connection_setup"

class Chitter < Sinatra::Base

  get "/peeps" do
    @all_peeps = Peep.show_peeps
    erb(:peeps)
  end

  post "/peeps/add_peep" do
    @username = params[:username]
    @message = params[:message]
    Peep.create(username: @username, message: @message)
    redirect "/peeps"
  end
  
  post "/peeps/sort-by-date" do
    redirect "/peeps/sorted-peeps"
  end

  get "/peeps/sorted-peeps" do
    @date_sorted_peeps = Peep.sort_by_date
    erb(:date_sorted_peeps)
  end

  post "/peeps/peeps-search" do
    Peep.search(params[:search_peeps])
    redirect "/peeps/search-results"
  end

  get "/peeps/search-results" do
    @results = Peep.search_results
    erb(:search_results)
  end 

  run! if app_file == $0
end
