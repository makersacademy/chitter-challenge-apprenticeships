require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Test page'
  end

  run! if app_file == $0
end
