def setup_test_database
  connection = DatabaseConnection.setup('chitter_test')
  connection.query("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = DatabaseConnection.setup('chitter_test')
  result = connection.query("INSERT INTO peeps (message) values ('This is a peep!');")
end
