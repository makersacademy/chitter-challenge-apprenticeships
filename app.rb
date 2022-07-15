require 'sinatra/base'
# require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  # configure :development do
  #   register Sinatra::Reloader
  # end 

  # get '/' do
  #   'Hello World'
  # end

  get '/peeps' do
    # p ENV
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    # p params 
    # p "Form data submitted to the /peeps route!"
    message = params['message']
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    redirect '/peeps'    
  end

  run! if app_file == $0
end
