require 'pg'

class Peeps
  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.date
    Time.now.strftime("%Y-%m-%d")
  end

  def self.add(new_message)
    insert = "INSERT INTO peeps (message, date) VALUES ('#{new_message}', '#{date}') RETURNING id, message, date;"
    result = DatabaseConnection.query(insert)
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

  def self.filter(keyword)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';")

    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.delete(id:)
    # Removes comments for specific peep so peep itself can be deleted
    DatabaseConnection.query("DELETE FROM comments WHERE peep_id = #{id};")
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
  end

  def self.update(id:, message:, date:)
    result = DatabaseConnection.query("UPDATE peeps SET message = '#{message}', date = '#{date}' WHERE id = #{id} RETURNING id, message, date;")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

  def self.find(id:)

    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

  def comments
    DatabaseConnection.query("SELECT * FROM comments WHERE peep_id = #{id};")
  end

end
