require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peeps'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

post '/peeps' do 
  Peeps.create(message: params[:message], date: params[:date])
  redirect '/peeps'
end 

  get '/peeps' do
    @peeps = Peeps.list
    erb :peeps
  end


  run! if app_file == $0
end