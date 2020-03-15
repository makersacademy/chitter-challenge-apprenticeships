require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter World'
  end

  get '/peeps' do 
  	@peeps = Peep.show_all
  	erb :'peeps/index'
  end


  run! if app_file == $0
end
