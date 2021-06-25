require_relative 'database_connection'

class User
  attr_reader :username, :id


  def self.add(username:, password:)
    new_user = DatabaseConnection.query(sql: "INSERT INTO users (username, password) VALUES($1, $2) RETURNING id, username, password;", params: [username, password])
    User.new(
      username: new_user[0]['username'],
      password: new_user[0]['password'],
      id: new_user[0]['id'],
    )
  end

  def self.all
    users = DatabaseConnection.query(sql: 'SELECT * FROM users;', params: [])
    users.map do |user|
      User.new(
        username: user['username'],
        password: user['password'],
        id: user['id'],
      )
    end
  end


  def initialize(username:, password:, id:)
    @username = username
    @password = password
    @id = id
  end
end
