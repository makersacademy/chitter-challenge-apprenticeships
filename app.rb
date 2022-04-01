require "sinatra/base"
require "./lib/peeps.rb"

class Chitter < Sinatra::Base
  get "/test" do
    "Test page"
  end

  get "/peeps" do
    @peeps = Peeps.all
    erb(:peeps)
  end

  get "/peeps/new" do
    erb(:new_peep)
  end

  post '/peeps' do
    Peeps.create(message = params[:peep])
    redirect('/peeps')
  end
  
  run! if app_file == $0
end
