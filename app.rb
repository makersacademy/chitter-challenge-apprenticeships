require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/peep'
require_relative './lib/peeps_data'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end
  get '/' do
    @peeps_data = PeepsData.new
    @list = @peeps_data.list
    erb :display
  end
  post '/message_box' do
    @peeps_data = PeepsData.new
    @peeps_data.add(Peep.new(params[:message]))
    redirect '/'
  end
  post '/filter_box' do
    $keyword = params[:keyword]
    redirect '/filtered_peeps'
  end
  get '/filtered_peeps' do
    @peeps_data = PeepsData.new
    @list = @peeps_data.list_by_keyword($keyword)
    erb :display_filtered
  end
  post '/return' do
    redirect '/'
  end
  run! if app_file == $0
end
