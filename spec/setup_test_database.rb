require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_rows_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, date) values ('This is a peep!', '20210623');")
  connection.exec("INSERT INTO peeps (message, date) values ('This is another peep!', '20210622');")
end
