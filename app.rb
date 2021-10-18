require 'sinatra/base'
require './lib/Peep.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all_peeps()
    erb(:peeps)
  end
    

  run! if app_file == $0
end
