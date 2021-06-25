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

  run! if app_file == $0
end
