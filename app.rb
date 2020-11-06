require 'sinatra/base'
require './lib/peeps'
require './lib/setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:index)
  end

  run! if app_file == $0
end
