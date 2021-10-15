require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end 

  get '/test' do
    'Test page'
  end

  get '/messages' do
    @peeps = Peeps.all
    erb :'peeps/index'

  end   

  get '/messages/new' do
    erb :"peeps/new"
  end

  # post '/messages' do
  #   message = params['message']
  #   connection = PG.connect(dbname: 'chitter')
  #   connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  #   redirect '/messages'
  # end

  post '/messages' do
    Peeps.create(message: params[:message])
    redirect '/messages'
  end

  run! if app_file == $0
end
