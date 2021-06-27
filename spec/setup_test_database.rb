require 'pg'
require 'peep'
require 'user'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users;")
end

def add_row_to_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (username, message) values ('Firsty McFirstFace', 'This is a peep!');")
end

def add_test_user_and_peep(username: , password: , message: )
  user = User.add(username: username, password: password)
  peep = Peep.add(username: username, message: message)
  return user, peep
end
