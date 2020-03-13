require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_rows_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, timestamp) VALUES ('This is a peep!', CURRENT_TIMESTAMP)")
  connection.exec("INSERT INTO peeps (message, timestamp) VALUES ('This is a second peep!', CURRENT_TIMESTAMP)")
end
