require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :welcome
  end 

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps/add' do
    Peep.add(message: params[:message])
    redirect '/peeps'
  end

  get '/peeps/find' do
    erb :find
  end

  post '/peeps/result' do
    @peep = Peep.find(keyword: params[:keyword])
    erb :result
  end

  run! if app_file == $0
end
