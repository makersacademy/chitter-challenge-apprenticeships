require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.see_peeps 
    erb :'peeps/index'
  end  

  run! if app_file == $0
end

