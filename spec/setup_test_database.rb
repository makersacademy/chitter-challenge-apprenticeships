require 'pg'

# script written below to clear the test database each time we run a test

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  # clears the message table 
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")   
end
