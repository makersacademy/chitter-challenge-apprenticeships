require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messages' do
    Peep.toggle_order if params['sorting']
    filter = " WHERE message LIKE '%#{params['filter_keyword']}%'"
    @all_peeps = Peep.all(filter)
    erb :messages
  end

  post '/messages/peep' do
    new_peep = params[:new_peep]
    Peep.create(new_peep) unless new_peep.empty?
    redirect '/messages'
  end

  run! if app_file == $0
end
