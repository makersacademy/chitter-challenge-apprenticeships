require "sinatra/base"
require "sinatra/reloader"
require "sinatra/flash"
require "./database_connection_setup"
require "uri"


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
    "just started my coding challenge!"
  end

  run! if app_file == $0
end
