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
    @reversed = params[:reversed]
    @find = params[:find]
    connection = PG.connect(dbname: 'chitter_test', user: 'JMMakers', password: '1234')
    result = connection.exec('SELECT * FROM peeps')
    @results = result.map { |entry| entry }
    if @find
      find_results = []
      @results.each { |entry| find_results << entry if entry["message"].include? @find }
      @results = find_results
    end
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
