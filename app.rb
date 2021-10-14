require "sinatra/base"
require "sinatra/reloader"
require_relative "./lib/peep"

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get "/peeps" do
    @all_peeps = Peep.show_peeps
    erb(:peeps)
  end

  run! if app_file == $0
end
