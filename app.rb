require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/database_connection.rb'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    @all_peeps = DatabaseConnection.fetch
    erb(:index)
  end

  post '/newpeep' do
    DatabaseConnection.create(message: params[:message], name: "Developer", timestamp: Time.new.strftime("%d/%m/%Y %k%M"))
    redirect '/'
  end

  run! if app_file == $0
end
