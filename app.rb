require 'sinatra/base'
require './lib/peeps'
require './lib/setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  get '/test' do
    'Test page'
  end

  get '/peeps/new' do
    erb(:peeps_new)
  end
  post '/peeps' do
    Peep.add(params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  run! if app_file == $0
end
