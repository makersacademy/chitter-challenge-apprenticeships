require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    @peeps_return = Peep.all
    erb :peeps
  end

  get '/peeps/post' do
    erb :post
  end

  post '/peeps/new' do
    Peep.post(params[:message])
    redirect '/peeps'
  end
  get '/test' do
    'Test page'
  end

  run! if app_file == $0
end
