require 'sinatra/base'
require 'sinatra'
require_relative './lib/peep_accessor'
enable :sessions

class Chitter < Sinatra::Base
  get '/' do
    p Time.now
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

  get '/filter_peeps' do
    erb(:filter_peeps)
  end

  post "/filter_peeps" do
    # i will go to hell for doing this
    $filtered_peeps = PeepAccessor.filter_peeps_by_keyword(params[:keyword])
    redirect '/display_filtered_peeps'
  end

  get '/display_filtered_peeps' do
    @filtered_peeps = $filtered_peeps
    erb(:display_filtered_peeps)
  end

  run! if app_file == $0
end
