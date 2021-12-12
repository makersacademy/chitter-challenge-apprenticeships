require 'pg'

def test_db_inserts
    connection = PG.connect(dbname: 'chitter_test')
      # Add test data
      connection.exec("INSERT INTO peeps (message) VALUES ('I hate mondays');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Lasagne is my favourite');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Garfield is a cool guy');")
end