require 'sinatra/base'
require_relative "lib/peep.rb"

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
