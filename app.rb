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

  run! if app_file == $0
end
