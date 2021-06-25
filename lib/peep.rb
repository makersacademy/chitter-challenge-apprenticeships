require 'time'
require_relative 'database_connection'

class Peep
  attr_reader :username, :message, :id, :date

  def self.add(username:, message:)
    date_full = Time.new
    date = "#{date_full.strftime("%m/%d/%Y at %I:%M%p")}"
    created = DatabaseConnection.query(sql: "INSERT INTO peeps (username, message, date) VALUES($1, $2, $3) RETURNING id, username, message, date;", params: [username, message, date])
    Peep.new(
      date: created[0]['date'],
      username: created[0]['username'],
      message: created[0]['message'],
      id: created[0]['id'],
    )
  end

  def self.all
    peeps = DatabaseConnection.query(sql: 'SELECT * FROM peeps;', params: [])
    peeps.map do |peep|
      Peep.new(
        username: peep['username'],
        message: peep['message'],
        id: peep['id'],
        date: peep['date']
      )
    end
  end

  def self.reverse(filter="%")
    filtered_peeps = DatabaseConnection.query(sql: 'SELECT * FROM peeps WHERE message LIKE $1 ORDER BY date DESC;', params: ["%#{filter}%"])
    filtered_peeps.map do |peep|
      Peep.new(
        username: peep['username'],
        message: peep['message'],
        id: peep['id'],
        date: peep['date']
      )
    end
  end

  def self.search(keyword)
  end

  def initialize(username:, message:, id:, date:)
    @username = username
    @message = message
    @id = id
    @date = date
  end
end
