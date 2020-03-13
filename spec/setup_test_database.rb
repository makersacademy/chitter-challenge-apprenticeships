require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
  connection.exec("NSERT INTO peeps (message) values ('I saw a fox!');")
end

# p "Setting up test database ..."
#
# connection = PG.connect(dbname: 'chitter_test')
#
# connection.exec("TRUNCATE peeps;")
