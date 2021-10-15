require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_rows_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, username, date) values ('This is my first peep!', 'User1', '15/10/2021');")
  connection.exec("INSERT INTO peeps (message, username, date) values ('This is my second peep!', 'User1', '15/10/2021');")
end
