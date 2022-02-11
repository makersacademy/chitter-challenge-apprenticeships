require 'sinatra'
require "sinatra/reloader" if development?
require_relative "./lib/chitter_message"

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
