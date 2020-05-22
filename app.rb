require 'sinatra/base'
require './lib/peep.rb'
require 'pg'

class Chitter < Sinatra::Base
  get '/test' do
    redirect '/messages'
  end

  get '/messages' do
    @peeps = Peep.all
    erb :index
  end

  run! if app_file == $0
end
