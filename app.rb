require 'sinatra/base'
require './lib/messages'

class Chitter < Sinatra::Base
  enable :sessions
  configure do
    enable :reloader
  end 

  get '/test' do
    'Test page'
  end

  get '/chitter' do 
    erb :index
  end

  get '/peeps' do
    @messages = Messages.all
    erb :allpeeps
  end 

  get '/drafts' do
    erb :post
  end

  post '/postpeep' do 
    peep = params['message']
    Messages.create(message: peep)
    redirect('/chitter')
  end


  run! if app_file == $0
end
