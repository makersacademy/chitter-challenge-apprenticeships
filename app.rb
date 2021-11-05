require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    sorting = params['sorting']
    @all_peeps = Peep.all(order: sorting)
    @sorting = (sorting == 'newest') ? 'oldest' : 'newest'
    erb :messages
  end

  post '/messages/peep' do
    new_peep = params[:new_peep]
    Peep.create(new_peep) unless new_peep.empty?
    redirect '/messages'
  end

  run! if app_file == $0
end
