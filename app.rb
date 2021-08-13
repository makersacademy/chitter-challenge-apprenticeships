require 'sinatra/base'
require_relative "lib/peep.rb"
require 'pg'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/post'
  end

  post '/peeps' do
    peep = params['peep']
    Peep.post(peep: peep)
    redirect '/peeps'

    
  end

  run! if app_file == $0
end
