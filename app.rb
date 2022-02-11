require "sinatra"
require 'sinatra/reloader' if development?
require 'pg'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    redirect :messages
  end

  get "/messages" do
    connection = PG.connect(dbname: 'chitter_test', user: 'JMMakers', password: '1234')
    result = connection.exec('SELECT * FROM peeps')
    @results = result.map { |bm| bm }
    puts @results
    erb :messages
  end

  run! if app_file == $0
end
