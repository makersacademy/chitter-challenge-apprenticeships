require "sinatra/base"
require "sinatra/reloader"

class Chitter < Sinatra::Base
  get "/test" do
    "Test page"
  end

  run! if app_file == $0
end
