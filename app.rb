require 'rack/handler'
require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/posts' do
    @posts = Peeps.all
    # p @posts
    erb(:'posts/index')
  end

  get '/posts/new' do
    erb :"posts/new"
  end

  post '/posts' do
    Peeps.create(peep: params['peep'], time: params['time'])
    p params['peep']
    p params['time']
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (message) VALUES('#{peep}')")
    redirect '/posts'
  end

  run! if app_file == $0
end
