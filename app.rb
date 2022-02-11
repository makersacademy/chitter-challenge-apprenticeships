require 'sinatra/base'
require 'pg'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    Peep.connect('chitter')
    @result = Peep.list_peeps
    erb :peeps
  end

  run! if app_file == $0
end
