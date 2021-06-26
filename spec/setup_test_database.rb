require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_rows_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
  connection.exec("INSERT INTO peeps (message) VALUES ('Another peep!');")
  connection.exec("INSERT INTO peeps (message) VALUES ('One more peep!');")
end
