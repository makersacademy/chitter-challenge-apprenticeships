require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @test_peep = Peep.new(user: 'Testguy', content: 'This is a peep!', timestamp: '19/02/2021 1148')
    erb(:index)
  end

  run! if app_file == $0
end
