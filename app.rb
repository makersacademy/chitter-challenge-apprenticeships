require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = [{ date: '01/01/2021', peep: 'This is a peep!' }]
    erb :index
  end

  run! if app_file == $0
end
