require 'sinatra/base'
require './lib/chitter_homepage'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @peeps = Chitter_Page.view
    erb :peeps
  end

  get '/new' do
    erb :"new_message"
  end

  post '/create' do
    Chitter_Page.create(params[:message], params[:message_date])
    redirect "/chitter"
  end

  run! if app_file == $0
end
