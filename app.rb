require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  require 'sinatra/reloader' if development?

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/post_peep' do
    Peep.add(message: params[:message])
    redirect '/'
  end

  run! if app_file == $0
end
