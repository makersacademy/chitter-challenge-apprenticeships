require 'sinatra/base'
require_relative 'lib/peeps'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/peep' do
    erb :peep
  end

  post '/' do
    @message = params[:message]
    Peeps.add(@message)
    redirect '/'
  end

  run! if app_file == $0
end
