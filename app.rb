require 'sinatra/base'
require_relative './lib/peep_accessor'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = PeepAccessor.all
    erb(:index)
  end

  get '/add_peep' do
    erb(:add_peep)
  end

  post "/add_peep" do
    PeepAccessor.add_peep(params[:peep])
    redirect '/'
  end
  run! if app_file == $0
end
