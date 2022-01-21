require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Message.all
    erb(:board)
  end

  post '/peep/new' do
    Message.create(message: params[:peep])
    redirect '/'
  end

  run! if app_file == $0
end
