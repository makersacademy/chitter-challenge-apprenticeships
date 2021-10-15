require "sinatra/base"
require_relative "lib/peeps"

class Chitter < Sinatra::Base
  get "/test" do
    "Test page"
  end

  get "/messages" do
    @messages = Peeps.all
    erb :messages
  end

  run! if app_file == $0
end
