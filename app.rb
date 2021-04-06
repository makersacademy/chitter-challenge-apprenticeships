require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do 
    erb :new
  end

  post '/peeps' do 
    Peep.create(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps/sort' do
    @peeps = Peep.sort
    erb :sorted
  end

  post '/peeps/sort' do
    redirect '/peeps'
  end
  
  get '/peeps/filter' do
    @keyword = keyword
    erb :filter
  end

  post '/peeps/filter' do
    @keyword = keyword
    @peeps = Peep.filtered(keyword)
    erb :filtered_peeps
  end

  run! if app_file == $0
end
