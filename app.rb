require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'
require './lib/database_connection'

class Chitter < Sinatra::Base
  enable :sessions

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
      @peeps = Peep.filtered(session[:search_keyword])
    end
    erb :peeps
  end

  post '/peeps' do
    today = Time.now
    date = today.strftime('%Y%m%d')
    Peep.create(params[:message], date)
    redirect '/peeps'
  end

  post '/search' do
    session[:search_keyword] =  params[:search_keyword]
    redirect '/peeps'
  end

  run! if app_file == $0
end
