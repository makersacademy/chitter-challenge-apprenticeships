require 'sinatra/base'
require_relative './lib/peeps.rb' 

class Chitter < Sinatra::Base
enable :sessions

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:new_peep)
  end

  post '/peeps_new' do
    Peeps.add(message: params[:message])
    redirect('/peeps')
  end

  post '/peeps/delete' do
    Peeps.delete(id: params[:id])
    redirect('/peeps')
  end

  post '/peeps/filter' do
    session[:keyword] = params[:keyword]
    redirect('/peeps/filtered')
  end

  get '/peeps/filtered' do
    @peeps = Peeps.filter(keyword: session[:keyword])
    erb(:peeps)
  end

  run! if app_file == $0
end
