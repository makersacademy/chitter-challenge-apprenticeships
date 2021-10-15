require 'sinatra/base'
require 'peep_accessor'

class Chitter < Sinatra::Base
  get '/' do
    'This is a peep!'
  end

  get '/test' do
    @peeps = ['Test page']
    erb(:index)
  end
  run! if app_file == $0
end
