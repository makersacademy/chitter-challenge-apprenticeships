require_relative "database_connection"

class Peep
  def self.show_peeps
    result = DatabaseConnection.query("SELECT id, username, message, post_date, TO_CHAR(post_date, 'dd/mm/yyyy') FROM peeps;")
    result.map do |row|
      { id: row["id"], username: row["username"], message: row["message"], post_date: row["to_char"] }
    end
  end

  def self.create(username:, message:)
    DatabaseConnection.query("INSERT INTO peeps (username, message) VALUES ($1, $2);", [username, message])
  end

  def self.sort_by_date
    result = DatabaseConnection.query("SELECT id, username, message, post_date, TO_CHAR(post_date, 'dd/mm/yyyy') FROM peeps ORDER BY post_date DESC;")
    result.map do |row|
      { id: row["id"], username: row["username"], message: row["message"], post_date: row["to_char"] }
    end
  end
end
