require 'pg'

def setup_database
  connection = PG.connect(dbname: 'chitter')
  connection.exec("TRUNCATE peeps;")
end