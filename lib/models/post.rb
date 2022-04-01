require_relative './databaseconnection'

class Post
  # Static Database Methods
  def self.get_by_id(id)
    DatabaseConnection.query("SELECT * FROM peeps WHERE id='#{id}'")
  end

  def self.create(body, user_id)
    DatabaseConnection.query("INSERT INTO peeps(body, user_id) VALUES('#{body}', '#{user_id}')")
  end
end
