require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE cheeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO cheeps(message, date_post) VALUES ('This is a test cheep!', '10-mar-2020')
    RETURNING id, message, date_post;")
end
