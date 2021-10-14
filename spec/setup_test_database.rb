require 'pg'
require 'date'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('This is a peep!', '#{DateTime.new(2021, 10, 14)}');")
end
