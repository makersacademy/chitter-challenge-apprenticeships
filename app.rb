require 'sinatra/base'
require 'pg'
require_relative 'database_setup'

class Chitter < Sinatra::Base
  get '/' do
    result = Database.query('SELECT message FROM peeps;')
    @peeps = result.map { |row| row['message'] }
    erb :index
  end

  post '/' do
    message = params[:message]
    result = Database.query('INSERT INTO peeps (message) VALUES ($1);', [message])
    redirect '/'
  end

  run! if app_file == $0
end
