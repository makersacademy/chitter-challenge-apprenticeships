require "pg"

def setup_test_database
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("INSERT INTO peeps (message, create_time) values ('This is a peep!', '2021-06-26 12:00:01+01');")
end

def add_another_row_to_test_database
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("INSERT INTO peeps (message, create_time) values ('This is a recent peep!', '2021-06-27 13:00:01+01');")
end
