require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peep'

class Chitter < Sinatra::Base
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
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    today = Time.now
    date = today.strftime('%Y%m%d')
    Peep.create(params[:message], date)
    redirect '/peeps'
  end

  run! if app_file == $0
end
