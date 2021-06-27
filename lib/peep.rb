require 'time'
require_relative 'database_connection'

class Peep
  attr_reader :username, :message, :id, :date

  def self.add(username:, message:)
    date_full = Time.new
    date = "#{date_full.strftime("%m/%d/%Y at %H:%M")}"
    date_time = "#{date_full.strftime("%m/%d/%Y at %H:%M:%S:%L:%N")}"
    created = DatabaseConnection.query(sql: "INSERT INTO peeps (username, message, date, date_time) VALUES($1, $2, $3, $4) RETURNING id, username, message, date;", params: [username, message, date, date_time])
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
    filtered_peeps = DatabaseConnection.query(sql: 'SELECT * FROM peeps WHERE message LIKE $1 ORDER BY date_time DESC;', params: ["%#{filter}%"])
    filtered_peeps.map do |peep|
      Peep.new(
        username: peep['username'],
        message: peep['message'],
        id: peep['id'],
        date: peep['date']
      )
    end
  end

  def self.find_by_user_id(user_id: )
    user_peeps_sorted = DatabaseConnection.query(sql: 'SELECT * FROM peeps WHERE user_id LIKE $1 ORDER BY date_time DESC;', params: [user_id])
    user_peeps_sorted.map do |peep|
      Peep.new(
        username: peep['username'],
        message: peep['message'],
        id: peep['id'],
        date: peep['date']
      )
    end
  end

  def initialize(username:, message:, id:, date:)
    @username = username
    @message = message
    @id = id
    @date = date
  end
end
