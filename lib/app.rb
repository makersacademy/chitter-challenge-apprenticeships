require 'sinatra/base'
require_relative 'database'

Database.init('chitter')

class Chitter < Sinatra::Base
  def render_page(page)
    erb page, { :layout => :layout }
  end

  get '/' do
    @peeps = Database.peeps.sort { |a, b| a.created_at <=> b.created_at }.reverse!
    render_page :index
  end

  get '/search' do
    @query = params[:query]
    redirect '/' if @query.nil?
    @peeps = Database.search(@query).sort { |a, b| a.created_at <=> b.created_at }.reverse!
    render_page :index
  end

  get '/post' do
    render_page :post
  end

  post '/post' do
    Database.peep(ERB::Util.html_escape(params[:content]))
    redirect '/?success'
  end

  run! if app_file == $0
end
