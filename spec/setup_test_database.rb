require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_rows_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, timestamp) VALUES ('This is a peep!', '2020-03-13 11:57:31.08057+00')")
  connection.exec("INSERT INTO peeps (message, timestamp) VALUES ('This is a second peep!', '2020-03-13 11:57:34.08057+00')")
end
