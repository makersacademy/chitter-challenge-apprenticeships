require "database_connection"

class Peep
  def self.show_peeps
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row|
      { username: row["username"], post: row["message"] }
    end
  end

end