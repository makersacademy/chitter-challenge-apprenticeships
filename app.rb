require 'sinatra/base'
require './lib/peep.rb'
require 'pg'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/messages'
  end

  get '/messages' do
    @peeps = Peep.all
    erb :index
  end

  get '/messages/new' do
    erb :new
  end

  post '/messages/new' do
    Peep.create(message: params[:message])
    redirect '/messages'
  end

  run! if app_file == $0
end
