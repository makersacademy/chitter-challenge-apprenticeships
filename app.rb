require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  def select_database
    'chitter_test' if ENV['ENVIRONMENT'] == 'test'
    'chitter'
  end

  get '/' do
    redirect '/post'
  end

  get '/post' do
    erb :post
  end
  
  get '/peeps' do
    Peep.connect(select_database)
    @result = Peep.list_peeps
    erb :peeps
  end

  post '/peeps' do
    Peep.connect(select_database)
    Peep.post_peep(params['peep'])
    @result = Peep.list_peeps
    erb :peeps
  end

  run! if app_file == $0
end
