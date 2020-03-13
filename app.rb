require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/posts' do
	  @peeps = Peep.all
  	erb :index
  end

  get '/posts/new' do 
  	erb :"posts/new"
  end

  post '/posts' do 
  	Peep.create(message: params[:message])
  	redirect '/posts'
  end

  run! if app_file == $0
end
