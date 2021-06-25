require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'
require './lib/database_connection'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end
  
  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    if session[:search_keyword].nil?
      @peeps = Peep.all
    else
      @search_keyword = session[:search_keyword]
      @peeps = Peep.filtered(@search_keyword)
    end
    erb :peeps
  end

  post '/peeps' do
    today = Time.now
    date = today.strftime('%Y%m%d')
    Peep.create(params[:message], date)
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(params[:id])
    redirect '/peeps'
  end

  post '/search' do
    session[:search_keyword] =  params[:search_keyword]
    redirect '/peeps'
  end

  run! if app_file == $0
end
