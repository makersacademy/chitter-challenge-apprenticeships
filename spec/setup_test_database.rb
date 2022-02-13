require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  
  connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
  connection.exec("INSERT INTO peeps (message) VALUES('Meditate to evolve.');")
  connection.exec("INSERT INTO peeps (message) VALUES('Stay in the present moment.');")
  connection.exec("INSERT INTO peeps (message) VALUES('Being of service to others is what brings true happiness.');")
end
