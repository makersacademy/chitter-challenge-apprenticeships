require 'sinatra/base'
require './lib/services/peep_service'
require './lib/repositories/peep_repository'
require './lib/database/database_connection_setup'

class Chitter < Sinatra::Base

  def initialize(app = nil, peep_service = PeepService.new(PeepRepository.new))
    super(app)
    @peep_service = peep_service
  end

  get '/peeps' do
    @peeps = @peep_service.find_all_peeps
    erb :peeps
  end
  run! if app_file == $0
end
