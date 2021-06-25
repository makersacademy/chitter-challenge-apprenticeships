require 'sinatra/base'
require '/Users/ok/Projects/individual-challenges/chitter-challenge-apprenticeships/lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions
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

  get '/search' do
    @search = params[:search]
    @peeps = Peep.all
    p @peeps.count
    p @peeps[1][:message]
    p @search
    @peeps = @peeps.select { |peep| peep[:message].downcase.include?(@search.downcase)  }
    p @peeps.count
    erb :'search/index'
  end

  run! if app_file == $0
end
