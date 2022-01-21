require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, date) values ('This is a test peep!', 'NOW()');")
  connection.exec("INSERT INTO peeps (message, date) values ('This is another test peep!', 'NOW()');")
end
