require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE cheeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO cheeps(message) VALUES ('This is a test cheep!')
    RETURNING id, message, date_post;")
end

def add_test_data_to_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO cheeps(message) VALUES ('This is a test cheep!');")
  connection.exec("INSERT INTO cheeps(message) VALUES ('More information being added!');")
  connection.exec("INSERT INTO cheeps(message) VALUES ('We could use this for FILTERing!');")
  connection.exec("INSERT INTO cheeps(message) VALUES ('Or this for FILTER testing!');")
  connection.exec("INSERT INTO cheeps(message) VALUES ('Not to get carried away with that!');")
end
