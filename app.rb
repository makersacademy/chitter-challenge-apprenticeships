require 'sinatra/base'
require_relative './lib/peep_manager.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @manager = PeepManager.new()
    erb :peeps
  end

  run! if app_file == $0
end
