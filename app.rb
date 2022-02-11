require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  def select_database
    'chitter_test' if ENV['ENVIRONMENT'] == 'test'
    'chitter'
  end

  get '/peeps' do
    Peep.connect(select_database)
    @result = Peep.list_peeps
    p @result
    erb :peeps
  end

  run! if app_file == $0
end
