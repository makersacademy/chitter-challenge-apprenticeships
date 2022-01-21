require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @all_peeps = [{ user: 'test user', message: 'test peep' }]
    erb(:index)
  end

  run! if app_file == $0
end
