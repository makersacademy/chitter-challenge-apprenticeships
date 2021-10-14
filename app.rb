require 'sinatra/base'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  

  run! if app_file == $0
end
