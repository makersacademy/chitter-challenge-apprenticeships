require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter homepage'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end



  run! if app_file == $0
end
