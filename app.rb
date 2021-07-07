require 'sinatra/base'
require './lib/comments'
require './lib/db_connection'


class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @chitters = Comments.all
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/message/new' do
    Comments.create(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
