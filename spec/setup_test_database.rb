require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_2_rows_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message, time_sent) values ('This is a peep!', '01/01/1980');")
  connection.exec("INSERT INTO peeps (message, time_sent) values ('This is also a peep!', '02/02/1980');")
end
