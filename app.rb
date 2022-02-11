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
    erb :messages
  end

  get "/new_peep" do
    erb :new_peep
  end

  post "/submit_new_peep" do
    peep_text = params[:new_peep_text]
    connection = PG.connect(dbname: 'chitter_test', user: 'JMMakers', password: '1234')
    connection.exec("INSERT INTO peeps (message) VALUES ('#{peep_text}')")
    redirect :messages
  end

  run! if app_file == $0
end
