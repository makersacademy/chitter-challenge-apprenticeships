require 'pg'

# script written below to clear the test database each time we run a test

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  # clears the message table 
  connection.exec("TRUNCATE peeps_test;")
end

def add_row_to_test_database
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps_test (message) values ('This is peeps!');")   
end
