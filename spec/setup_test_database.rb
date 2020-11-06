require 'pg'

def setup_test_database
  DatabaseConnection.setup(dbname: 'chitter_test')
  DatabaseConnection.query("TRUNCATE peeps;")
end

def add_row_to_test_database
  DatabaseConnection.setup(dbname: 'chitter_test')
  DatabaseConnection.query("INSERT INTO peeps (message) values ('This is a peep!');")
end
