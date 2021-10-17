require "sinatra/base"

class Chitter < Sinatra::Base
  get "/test" do
    "Test page"
  end

  get "/" do
    "<h1>chitter</h1>"
  end
end
