require 'sinatra/base'
require '/Users/ok/Projects/individual-challenges/chitter-challenge-apprenticeships/lib/peep.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/post' do
    Peep.post(message: params[:message])
    redirect('/')
  end

  run! if app_file == $0
end
