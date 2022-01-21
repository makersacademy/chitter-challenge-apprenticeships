require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    $peep = Peep.new
    erb(:index)
  end

  post '/new-peep' do
    $peep.peeps << { user: params[:peep_user], message: params[:peep_message] }
    redirect 'view-peeps'
  end

  get '/view-peeps' do
    erb(:index)
  end

  run! if app_file == $0
end
