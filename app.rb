require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messageboard' do
    @peep = Peep.all           
    erb :messageboard
  end

  get '/chatter' do
    erb :chatter
  end

  run! if app_file == $0
end
