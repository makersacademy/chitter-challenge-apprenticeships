require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  Peeps.create(message: "First Peep, HELLO Aladdin!")
  Peeps.create(message: "Second Peep, HELLO Genie!")
  Peeps.create(message: "Third Peep, HELLO Rajah!")
end
