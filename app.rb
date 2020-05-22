require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb (:index)
  end

  get '/peep_show' do
    @peeps = Peep.all
    erb (:peep_show)
  end

  run! if app_file == $0
end
