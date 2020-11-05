require 'sinatra/base'
require './lib/peep.rb'
require 'date'

class Chitter < Sinatra::Base

  attr_reader :peep

  get '/chitter' do
    @peep = Peep.all
    erb :'index'
  end

  get '/new' do
  erb :'new'
  end

  post '/new' do
    message = params[:message]
    date = Time.now.strftime("%d/%m/%Y")

    redirect '/chitter'
  end



  run! if app_file == $0
end
