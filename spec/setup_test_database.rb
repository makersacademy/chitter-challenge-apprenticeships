require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
  connection.exec("TRUNCATE users;")
end

def add_user
  Users.create(username: "Bob",password: "pass")
end

def login_user
  visit '/'
  fill_in(:username, with: 'Bob')
  fill_in(:password, with: 'pass')
  click_button('Submit')
end

def add_row_to_test_database
  Database.add_message(text: 'This is a peep!')
end
