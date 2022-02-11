require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'shtter_test')
  connection.exec("TRUNCATE poops;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'shtter_test')
  connection.exec("INSERT INTO poops (message) values ('This is a poop!');")
end
