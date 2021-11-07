require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
  get '/all_peeps' do
    @peeps_data= PeepsData.new
    @list = $peeps.list
    erb :display
  end
  post '/message_box' do
    $peeps.add(Peep.new(params[:message]))
    redirect '/all_peeps'
  end
  post '/filter_box' do
    $keyword = params[:keyword]
    redirect '/filtered_peeps'
  end
  get '/filtered_peeps' do
    @list = $peeps.filter($keyword)
    erb :display_filtered
  end
  post '/return' do
    redirect 'all_peeps'
  end
  run! if app_file == $0
end
