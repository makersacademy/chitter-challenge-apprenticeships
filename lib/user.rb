require "bcrypt"

class User
  attr_reader :id, :email
  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    encrypted_password = BCrypt::Password.create(password)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("INSERT INTO users (email, password) VALUES('#{email}','#{encrypted_password}') RETURNING id, email;")
     User.new(
      id: result[0]["id"],
      email: result[0]["email"],
    )
  end
  def self.authenticate(email:, password:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]["password"]) == password
    User.new(id: result[0]["id"], email: result[0]["email"])
  end
end
