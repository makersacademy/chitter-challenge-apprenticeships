require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec_params("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec_params("INSERT INTO peeps (message) values ('This is a peep!');")
end
