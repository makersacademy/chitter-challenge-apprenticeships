require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
get '/' do
  erb :index
end

get '/all' do
  @peeps = Peeps.all
  erb :outcome
end

#get 'all/add' do
  #erb :'all/add'
#end

post '/all' do
  Peeps.create(message: params[:message])
  redirect '/all'
end


  run! if app_file == $0
end
