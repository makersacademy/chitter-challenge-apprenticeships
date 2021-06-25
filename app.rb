require 'sinatra/base'
require './lib/tweets'


class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/tweets' do
    @tweets = Tweets.all
    erb :'tweets/index'
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    Tweets.create(user_id: params[:user_id], message: params[:message])
      redirect '/tweets'
  end

  run! if app_file == $0
end
