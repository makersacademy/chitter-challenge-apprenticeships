require 'pg'

# script written below to clear the test database each time we run a test

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  # clears the message table 
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');") 
    connection.exec("INSERT INTO peeps (message) VALUES('Adding test data within the tests');")   
    connection.exec("INSERT INTO peeps (message) VALUES('Saved as variable to instantiated Message class');")   
    connection.query('SELECT * FROM peeps;')
end
