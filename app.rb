require 'sinatra/base'
require_relative './lib/peeps.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do 
    @peeps = Peeps.all_peeps
    erb :peeps
  end 

  get '/peeps/new' do 
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.new_peep(peep_text: params[:peep_text]) #Check here for if the param in creating a neww peep matches the name it has here. 
    redirect '/peeps'
    erb :peeps
  end

  run! if app_file == $0
end
