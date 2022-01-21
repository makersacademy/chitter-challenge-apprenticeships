require 'sinatra/base'
require 'pg'
require_relative 'database_setup'

class Chitter < Sinatra::Base
  MAX_PEEP_LENGTH = 281

  get '/' do
    result = Database.query('SELECT message, posting_date FROM peeps;')
    @peeps = result.map { |row| { message: row['message'], date: row['posting_date'] } }
    erb :index
  end

  post '/' do
    message = params[:message]
    message = message[0, MAX_PEEP_LENGTH] if message.length > MAX_PEEP_LENGTH
    result = Database.query('INSERT INTO peeps (message) VALUES ($1);', [message])
    redirect '/'
  end

  run! if app_file == $0
end
