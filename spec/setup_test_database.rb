require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps RESTART IDENTITY;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, date) values ('This is a peep!', '2022-01-01');")
end
