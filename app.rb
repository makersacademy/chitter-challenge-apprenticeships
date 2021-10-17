require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/peep_dao'

class Chitter < Sinatra::Base
  # :nocov:
  configure :development do
    register Sinatra::Reloader
  end
  # :nocov:

  enable :sessions

  get '/' do
    @button_value = session[:reverse].nil? ? "Reverse" : "Normal"
    reverse = session[:reverse].nil? ? false : true
    @peeps = PeepDao.all(reverse, session[:filter])
    erb(:index)
  end

  get '/add_peep' do
    erb(:add_peep)
  end

  post '/add_peep' do
    PeepDao.create(Peep.new(params[:message], Time.now))
    redirect "/"
  end

  post '/reverse_peeps' do
    session[:reverse] = session[:reverse].nil? ? true : nil
    redirect "/"
  end

  post '/filter' do
    session[:filter] = params[:filter]
    redirect "/"
  end

  run! if app_file == $0
end
