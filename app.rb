require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base


  get '/messageboard' do
    @peeps = Peep.view_peeps
    erb :'messageboard/index'
  end

  run! if app_file == $0
end
