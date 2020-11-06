require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:'/peeps/index')
  end

  post '/peeps' do
    p params['message']
    redirect('/peeps')
  end

  get '/peeps/add' do
    erb(:'/peeps/add')
  end

  run! if app_file == $0
end
