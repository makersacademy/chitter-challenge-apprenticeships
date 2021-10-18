require 'sinatra/base'
require './lib/services/peep_service'
require './lib/repositories/peep_repository'
require './lib/database/database_connection_setup'

class Chitter < Sinatra::Base

  ORDER_CHRONOLOGICAL = "old-new"
  ORDER_REVERSE_CHRONOLOGICAL = "new-old"

  enable :sessions

  def initialize(app = nil, peep_service = PeepService.new(PeepRepository.new))
    super(app)
    @peep_service = peep_service
  end

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    filter = params[:filter]
    session[:filter] = filter
    set_order_button_option
    get_peeps(filter)
    puts session[:filter]
    erb :peeps
  end

  get '/new-peep' do
    erb :new_peep
  end

  post '/new-peep' do
    peep_text = params["peep-text"]
    @peep_service.post_peep(peep_text)
    redirect('/peeps')
  end

  private 

  def get_peeps(filter)
    if @peep_order == ORDER_CHRONOLOGICAL
      @peeps = @peep_service.find_all_peeps
    else
      get_peeps_reverce_chronological_order(filter)
    end
  end

  def get_peeps_reverce_chronological_order(filter)
    if filter.nil?
      @peeps = @peep_service.find_all_peeps.reverse
    else
      @peeps = @peep_service.find_all_peeps_with_filter(filter).reverse
    end
  end
  
  def set_order_button_option
    if params['peep-order'] == ORDER_REVERSE_CHRONOLOGICAL
      @peep_order = ORDER_CHRONOLOGICAL
      @peep_order_button = ORDER_REVERSE_CHRONOLOGICAL
    else
      @peep_order = ORDER_REVERSE_CHRONOLOGICAL
      @peep_order_button = ORDER_CHRONOLOGICAL
    end
  end

  run! if app_file == $0
end
