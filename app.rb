require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :"peeps/index"
  end

  get'/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    Peep.create(message: params[:message], date: params[:date])
    redirect '/peeps'
  end

  run! if app_file == $0
end
