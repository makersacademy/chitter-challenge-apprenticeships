require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps_add' do
    Peep.add(message: params[:message], date: params[:date])
    redirect '/peeps'
  end


  run! if app_file == $0
end
