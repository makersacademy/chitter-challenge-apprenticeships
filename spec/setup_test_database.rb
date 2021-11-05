require 'pg'

def setup_test_database
  p 'Truncating'
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  p ' Adding data in the setup'
  connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
end
