require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, date) VALUES ('This is a test peep!', 'NOW()');")
  connection.exec("INSERT INTO peeps (message, date) VALUES ('This is an old peep', '2021-01-01');")
  connection.exec("INSERT INTO peeps (message, date) VALUES ('This is another test peep!', '2022-01-01');")
end
