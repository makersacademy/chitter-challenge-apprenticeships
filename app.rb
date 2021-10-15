require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/add' do
    Peep.create(msg: params[:new_peep])
    redirect '/'
  end

  run! if app_file == $0
end
