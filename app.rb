require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  enable :sessions, :method_override

  get '/messageboard' do
    @peeps = Peep.view_peeps.reverse
    erb :'messageboard/index'
  end

  get '/messageboard/add' do 
    erb :'messageboard/add'
  end 

  post '/save-peep' do 
    Peep.post(message: params['message'])
    redirect '/messageboard'
  end 
  
  post '/messageboard/search' do 
    @peeps = Peep.search(keyword: params['keyword'])
    erb :'messageboard/results'
  end 

  run! if app_file == $0
end
