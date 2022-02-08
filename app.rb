require 'sinatra/base'
require 'sinatra/reloader' # start auto reload
require_relative './lib/chittermanager' 

class Chitter < Sinatra::Base
  register Sinatra::Reloader 

  get '/test' do
    'Test page'
  end

  get '/' do
    erb :index
  end
  
  get '/view' do
    if params[:filter] != "" && params[:filter] != nil
      @peepsr = Chittermanager.filter(filter: params[:filter])
    else
      @peepsr = Chittermanager.all 
    end   
    erb :view
  end

  get '/add' do
    erb :add
  end
  
  post '/add' do
    Chittermanager.create(peep: params[:message], time: Time.now)
    redirect '/view'
  end

  run! if app_file == $0
end
