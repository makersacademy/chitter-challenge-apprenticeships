require 'sinatra/base'
require "./lib/peep"
class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :index
  end

  get "/new_peep" do
    Peep.create(message: params[:message])
    erb :new
    redirect "/peeps"
  end 

  run! if app_file == $0
end
