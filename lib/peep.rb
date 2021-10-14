require_relative "database_connection"

class Peep
  def self.show_peeps
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row|
      { username: row["username"], message: row["message"] }
    end
  end

  def self.create(username:, message:)
    DatabaseConnection.query("INSERT INTO peeps (username, message) VALUES ('#{username}', '#{message}');")
  end
end
