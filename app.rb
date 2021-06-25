require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb :index
  end

  get '/hello' do
    erb :hello
  end

  run! if app_file == $0
end
