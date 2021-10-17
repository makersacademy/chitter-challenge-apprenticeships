require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.see_peeps 
    erb :'peeps/index'
  end  

  get '/peeps/new' do
    p params
    p "Form data submitted to the /peeps route!"
    erb :"peeps/new"
  end

  post '/peeps' do
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/peeps'
  
  end

  run! if app_file == $0
end

