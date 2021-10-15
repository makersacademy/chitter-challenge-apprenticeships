require "sinatra/base"
require "sinatra/contrib"
require_relative "lib/peeps"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/test" do
    "Test page"
  end

  get "/messages" do
    @messages = Peeps.all
    erb :messages
  end

  get "/messages/new" do
    erb :new
  end

  post "/messages" do
    Peeps.create(params[:message])
    redirect "/messages"
  end

  run! if app_file == $0
end
