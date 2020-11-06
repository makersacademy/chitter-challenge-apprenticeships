require 'sinatra/base'
require_relative 'lib/chitter'

class Chitter < Sinatra::Base
  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    erb :FrontPage
  end

  post '/HomePage' do
    session[:name] = params[:Username]
    redirect '/HomePage'
  end

  get '/HomePage' do
    @name = session[:name]
    @peeps = Peeps.all
    erb :HomePage
  end

  post '/new' do
    Peeps.post(cheep: params[:new_peep])
    redirect '/HomePage'
  end

  get '/new' do
    erb :new
  end

  run! if app_file == $0
end
