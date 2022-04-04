require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/' do
    'Chitter'
  end

  get '/chitter' do
      @peeps = Peep.all
      erb :chitter
  end

  get '/my_peeps' do
      @peeps = Peep.own_peeps
      erb :my_peeps
  end

  get '/my_peeps/new_peep' do
    erb :post_peep
  end

  post '/my_peeps/create_peep' do
    @peeps_posted = Peep.post(message: params[:message], author_id: params[:author_id])
    redirect ('/my_peeps')
  end

  post '/chitter/search' do
    @keyword = params[:filter]
    p params #Just to check if keyword comes through
    @peeps_filtered = Peep.search(keyword: params[:filter])
    erb :filtered_results
  end

  run! if app_file == $0
end
