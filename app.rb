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

  get '/add_peep' do
  @params  = params[:peep]
    erb :add_peep
  end

  post '/add_peep' do
    test = Peeps.new
    @params = params[:peep]
    test.add_peep(@params)
    erb :peep_posted
  end



  run! if app_file == $0
end
