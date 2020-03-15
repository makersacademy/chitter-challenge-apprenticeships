require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/' do
    test = Peeps.new
    @message = test.view_all
    erb :homepage
  end

  run! if app_file == $0
end
