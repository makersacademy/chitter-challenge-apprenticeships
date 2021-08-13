require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/homepage.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @posts = HomePage.all
    erb :homepage
  end

  post '/addpost' do
    HomePage.create(params[:post])
    redirect '/'
  end

  get '/addpost' do
    erb :addpost
  end

  run! if app_file == $0
end