require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :message, :date

  def initialize(message:, date:)
    @message = message
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(message: peep['message'], date: peep['date'])
    end
  end

  def self.create(message)
    DatabaseConnection.query("INSERT INTO peeps (message, date)
      VALUES($1, $2);", [message, Time.now.to_s[0, 9]])
  end

  def self.filter(keyword)
    result = DatabaseConnection.query("SELECT * FROM peeps 
      WHERE message LIKE($1)", ["%#{keyword}%"])
    result.map do |peep|
      Peep.new(message: peep['message'], date: peep['date'])
    end
  end
end
