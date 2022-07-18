require 'sinatra/base'
require './lib/chitter'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    # @time = Peep.time
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], timestamp: params[:timestamp])

    # post '/bookmarks' do
    #   Bookmark.create(url: params[:url], title: params[:title])
    #   redirect '/bookmarks'
    # end
    # @time = Peep.time
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/add' do
    erb :"/peeps/add"
  end

  run! if app_file == $0
end
