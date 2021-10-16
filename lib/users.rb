class Users
  def self.create(username:, password:)
    connection = Database.connect
    result = connection.exec("SELECT username FROM users WHERE username = '#{username}'")
    if result.ntuples != 0
      return false
    end
    connection.exec("INSERT INTO users (username, password) VALUES('#{username}','#{password}')")
    true
  end
  
  def self.authenticate(username:, password:)
    connection = Database.connect
    result = connection.exec("SELECT * FROM users WHERE username = $1",[username])
    return result.ntuples != 0 && result[0]['password'] == password
  end
end