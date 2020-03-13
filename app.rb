require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Peep.all
    erb :index
  end

  post '/' do
    Peep.post(message: params['message'])
    redirect '/'
  end

  run! if app_file == $0
end
