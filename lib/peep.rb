require 'time'
require_relative 'database_connection'
require_relative 'user'

class Peep
  attr_reader :username, :message, :id, :date

  def self.add(username:, message:)
    self.set_date
    user_id = User.find_id(username: username)
    created = DatabaseConnection.query(sql: "INSERT INTO peeps (username, message, date, date_time, user_id) VALUES($1, $2, $3, $4, $5) RETURNING id, username, message, date;", params: [username, message, @date, @date_time, user_id])
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
    user_peeps_sorted = DatabaseConnection.query(sql: 'SELECT * FROM peeps WHERE user_id = $1 ORDER BY date_time DESC;', params: [(user_id.to_i)])
    return "it looks like you haven't posted any peeps yet" unless user_peeps_sorted.any?
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

  private

  def self.set_date
    date_full = Time.new
    @date = "#{date_full.strftime("%m/%d/%Y at %H:%M")}"
    @date_time = "#{date_full.strftime("%m/%d/%Y at %H:%M:%S:%L:%N")}"
  end

end
