require 'pg'

# script written below to clear the test database each time we run a test

def setup_test_database
  connection = PG.connect(dbname:'chitter_test')
  # clears the message table 
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
    connection = PG.connect(dbname:'chitter_test')
    # Add test data
    connection.exec("INSERT INTO peeps (message) values ('Working with the test database');")
    connection.exec("INSERT INTO peeps (message) values ('Adding test data within the tests');")
    connection.exec("INSERT INTO peeps (message) values ('Saved as variable to instantiated Message class');")
end
