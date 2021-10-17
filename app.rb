require 'sinatra/base'
require './lib/chitter_homepage'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/chitter' do
    @peeps = ChitterPage.view
    erb :peeps
  end

  get '/chitter/new' do
    erb :new_message
  end

  post '/chitter/create' do
    ChitterPage.create(params[:message])
    redirect "/chitter"
  end

  run! if app_file == $0
end
