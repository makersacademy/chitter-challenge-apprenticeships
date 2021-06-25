require 'sinatra/base'
require './lib/tweets'

class Chitter < Sinatra::Base
  enable :sessions
  get '/test' do
    'Test page'
  end    

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  get '/tweets/new' do
    erb :'tweets/new'
  end

  post '/tweets' do
    new_tweet = Tweets.create(user_id: session[:user_id], message: params[:message])
    new_tweet.save
      redirect '/tweets'
  end

  get '/tweets' do
    @tweets = Tweets.all
    erb :'tweets/index'
  end

  run! if app_file == $0
end
