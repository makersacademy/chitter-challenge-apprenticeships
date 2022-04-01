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

  get '/post' do
    render_page :post
  end

  post '/post' do
    Database.peep(params[:content])
    redirect '/?success'
  end

  run! if app_file == $0
end
