def setup_test_database
  connection = DatabaseConnection.setup('chitter_test')
  connection.query("TRUNCATE peeps, comments, users;")
end

def add_row_to_test_database
  connection = DatabaseConnection.setup('chitter_test')
  connection.query("INSERT INTO peeps (message) values ('This is a peep!');")
end
