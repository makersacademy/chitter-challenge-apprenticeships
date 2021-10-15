require "sinatra/base"
require "sinatra/contrib"
require_relative "lib/peeps"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/test" do
    "Teste page"
  end

  get "/messages" do
    @messages = Peeps.all
    erb :messages
  end

  run! if app_file == $0
end
