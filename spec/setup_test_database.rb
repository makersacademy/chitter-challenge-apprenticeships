require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'test_chitter')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  puts "called"
  connection = PG.connect(dbname: 'test_chitter')
  connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
end
