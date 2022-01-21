require 'pg'

class Peep
  attr_reader :id, :message, :created_at

  def initialize(id, message, created_at)
    @id = id
    @message = message
    @created_at = created_at
  end

  def self.all(order = "ASC", keyword = "")
    results = DatabaseConnection.query("SELECT * FROM peeps WHERE LOWER(message) 
                                        LIKE LOWER('%#{keyword}%') ORDER BY created_at #{order};")
    results.map { |peep| Peep.new(peep['id'], peep['message'], peep['created_at']) }
  end

  def self.create(message)
    result = DatabaseConnection.query("INSERT INTO peeps (message, created_at) VALUES 
                                       ('#{message}', '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}') 
                                       RETURNING *;")
    Peep.new(result[0]['id'], result[0]['message'], result[0]['created_at'])
  end
end
