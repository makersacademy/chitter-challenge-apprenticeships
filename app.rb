require 'sinatra/base'
require './lib/peep.rb'
require 'date'

class Chitter < Sinatra::Base

  attr_reader :peep, :searched, :keyword

  get '/chitter' do
    @peep = Peep.all
    erb :'index'
  end

  get '/new' do
  erb :'new'
  end

  get '/enter' do
    redirect '/new'
  end


  post '/new' do
  Peep.create(message: params[:message], date: Time.now.strftime("%d/%m/%Y %H:%M"))
    redirect '/chitter'
  end

  post '/search' do
  @searched = Peep.search(keyword: params[:keyword])
  @keyword = params[:keyword]
  connection = PG.connect(dbname: 'chitter_test')
erb:'search_page'
end




  run! if app_file == $0
end
