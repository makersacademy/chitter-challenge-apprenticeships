def setup_test_database
  Database.query('TRUNCATE peeps;')
end

def add_row_to_test_database(message)
  Database.query('INSERT INTO peeps (message) values ($1);', [message])
end
