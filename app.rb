require 'sinatra/base'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do 
    @peeps = Peeps.all_peeps
    erb :peeps
  end 

  run! if app_file == $0
end
