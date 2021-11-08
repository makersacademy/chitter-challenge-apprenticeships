require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/peep'
require_relative './lib/peeps_data'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
  get '/' do
    @list = PeepsData.list
    erb :display
  end
  post '/message_box' do
    PeepsData.add(Peep.new(params[:message]))
    redirect '/'
  end
  post '/filter_box' do
    $keyword = params[:keyword]
    redirect '/filtered_peeps'
  end
  get '/filtered_peeps' do
    @list = PeepsData.list_by_keyword($keyword)
    erb :display_filtered
  end
  post '/return' do
    redirect '/'
  end
  run! if app_file == $0
end
