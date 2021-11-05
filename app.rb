require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
  get '/all_peeps' do
    $peeps.sort_descending
    @list = $peeps.list
    erb :display
  end
  post '/message_box' do
    $peeps.add(Peep.new(params[:message]))
    redirect '/all_peeps'
  end
  post 'sort_box' do
    redirect 'all_peeps'
  end
  run! if app_file == $0
end
