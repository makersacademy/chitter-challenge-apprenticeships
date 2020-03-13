require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    #get the peeps data from the database
    #display the peeps int he view
  end

  run! if app_file == $0
end
