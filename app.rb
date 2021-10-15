require 'sinatra/base'
require_relative './lib/peep_accessor'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = PeepAccessor.all
    erb(:index)
  end

  get '/add_peep' do
    @peeps = PeepAccessor.all
    erb(:add_peep)
  end

  post "/add_peep" do
    p params
    PeepAccessor.add_peep(params[:peep])
    redirect '/'
  end
  run! if app_file == $0
end
