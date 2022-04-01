require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Welcome to Chitter!'
    erb :index
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end
  
  post '/peeps' do
    Peeps.create(message: params[:message], entry_date: params[:entry_date])
    redirect '/peeps'
  end

  get '/peeps/reverse' do
    @peeps = Peeps.reverse_chronology
    erb :peeps_reverse
  end

  get '/peeps/filter' do
    @filtered_peeps = Peeps.filter(params[:filter])
    erb :peeps_filter
  end

  run! if app_file == $0
end
