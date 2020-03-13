require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
	get '/' do
		'haha gotcha, try type in "/posts" up there&#9757;&#9757;&#9757;&#9757;'
	end
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
  	posted_date = Time.now.strftime("%d/%m/%Y %H:%M")
  	Peep.create(message: params[:message], date: posted_date)
  	redirect '/posts'
  end

  get '/posts/search' do 
  	erb :"posts/search"
  end
  post '/posts/search' do 
  	@peeps = Peep.search(params[:keywords])
  	erb :index
  end

  run! if app_file == $0
end
