require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peeps.all
    erb:index
  end

  get '/new_peep' do
    erb:post_a_peep 
  end

  post '/new_peep' do
    session[:new_post_message] = params[:new_post_message]
    Peeps.new_peep(message:session[:new_post_message])
    redirect ('/') 
  end

  post '/search' do
    session[:search] = params[:search]
    session[:search_results] = Peeps.search(search:session[:search])
    redirect ('/search') 
  end

  get '/search' do
    # here assigning the search to be peeps to re-use the erb
    @peeps = session[:search_results]
    erb:index 
  end

  run! if app_file == $0
end
