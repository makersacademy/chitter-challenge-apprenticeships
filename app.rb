require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/loader_storer.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @all_peeps = LoaderStorer.fetch
    erb(:index)
  end

  run! if app_file == $0
end
