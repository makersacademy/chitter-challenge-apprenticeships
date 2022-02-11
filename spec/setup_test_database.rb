require 'pg'
require 'peep'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  Peep.create('This is a peep!', '2022-01-21 12:00:00+00')
end
