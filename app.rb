require "sinatra/base"
require "sinatra/reloader"
require "sinatra/flash"
require "./database_connection_setup"
require "uri"
require "./lib/peep"


class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash
  enable :sessions, :method_override

  get '/' do
    redirect('/peeps')
  end

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    # p @peeps
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/add' do
    Peep.add(username: params[:username], message: params[:message])
    redirect('/peeps')
  end

  run! if app_file == $0
end
