require_relative './databaseconnection'

class User
  # Static Database Methods
  def self.get_by_id(id)
    DatabaseConnection.query("SELECT * FROM users WHERE id='#{id}'")
  end

  def self.get_by_username(username)
    DatabaseConnection.query("SELECT * FROM users WHERE username='#{username}'")
  end

  def self.create(username, password)
    DatabaseConnection.query("INSERT INTO users(username, password) VALUES('#{username}', '#{password}')")
  end
end
