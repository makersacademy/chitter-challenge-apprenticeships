require 'sinatra'
require "sinatra/reloader" if development?
require_relative "./lib/chitter_message"

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @list = Chitter_message.all(params[:reversed], session[:keyword])
    @reverse_list = Chitter_message.reverse_list(params[:reversed])
    erb :index
  end

  post '/filter_keyword' do
    session[:keyword] = params[:keyword]
    redirect '/'
  end

  post '/send_message' do
    Chitter_message.save_message(params[:message])
    redirect '/'
  end

  get '/clear_filter' do
    session[:keyword] = nil
    redirect '/'
  end

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
