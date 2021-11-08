require_relative '../lib/database_connection'

def setup_database
  if ENV['ENVIRONMENT'] == 'test'
    setup_test_database
    #add_row_to_test_database
  else
    DatabaseConnection.setup('chitter')
  end
end

def setup_test_database
  connection = DatabaseConnection.setup('chitter_test')
  connection.query("TRUNCATE peeps;")
end

def add_row_to_test_database
  # connection.query("INSERT INTO peeps (message) values ('This is a peep!');")
end