require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    "Testing testing"
  end

  get '/view_peeps' do
    @peeps = Peep.all
    erb :view_peeps
  end

  run! if app_file == $0
end
