require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base
  get '/' do
    'My Chitter App'
  end

  get '/messages' do
    @messages = Message.all
    # @messages variable called in the index view, iterated through and each element printed
    erb :index
  end

  get '/add_peep' do
    erb :play
    # View contains forms html elements
  end

  post '/add' do
    Message.add(message: params[:message], date: params[:date])
    #Adds values entered by user in the forms which are stored in the params hashes
    redirect '/messages'
  end

  run! if app_file == $0
end
