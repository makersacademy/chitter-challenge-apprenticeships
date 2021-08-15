require 'pg'
require_relative "../lib/timepeep.rb"

def setup_test_database
  @connection = PG.connect(dbname: 'chitter_test', user: "mikey")
  #@connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  @connection = PG.connect(dbname: 'chitter_test', user: "mikey")
  @connection.exec("INSERT INTO peeps (message, date) VALUES ('This is a test peep', '#{PeepTime.now}');")
end
