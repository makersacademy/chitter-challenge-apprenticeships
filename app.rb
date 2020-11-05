require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  attr_reader :peep

  get '/' do
    @peep = Peep.all
    erb :'index'
  end

  run! if app_file == $0
end
