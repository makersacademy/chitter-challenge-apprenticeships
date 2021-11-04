require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  $peeps = Peeps.new([Peep.new("This is a peep!")])

  get '/test' do
    'Test page'
  end
  get '/all_peeps' do
    @list = $peeps.list
    erb :display
  end
  run! if app_file == $0
end
