require 'sinatra/base'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    
    @peeps = Peeps.list_peeps
    erb(:home)
  end

  run! if app_file == $0
end
