require_relative 'database_connection'

class Peep
  attr_reader :id, :message, :username, :date

  def initialize(id, message, username, date)
    @id = id
    @message = message
    @username = username
    @date = date
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY id DESC')
    result.map { |peep| Peep.new(peep['id'], peep['message'], peep['username'], peep['date']) }
  end

  def self.create(message, username, date)
    result = DatabaseConnection.query(
      'INSERT INTO peeps (message, username, date) VALUES($1, $2, $3) RETURNING id, message, username, date;', [
        message, username, date])
    Peep.new(result[0]['id'], result[0]['message'], result[0]['username'], result[0]['date'])
  end

  def self.filter(keyword)
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE message LIKE ('%#{keyword.capitalize}%') OR message LIKE ('%#{keyword.downcase}%') OR message LIKE ('%#{keyword.upcase}%') ORDER BY id DESC")
    result.map { |peep| Peep.new(peep['id'], peep['message'], peep['username'], peep['date']) }
  end
end
