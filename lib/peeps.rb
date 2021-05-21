require 'pg'
require_relative 'database_connection'

class Peeps

  def self.all
    result = DatabaseConnection.query("SELECT id, message, date_trunc('second', datetime) AS datetime FROM peeps ORDER BY datetime DESC;")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        message: peep['message'],
        datetime: peep['datetime']
      )
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date_trunc('second', datetime) AS datetime")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], datetime: result[0]['datetime'])
  end

  def self.like(keyword:)
    result = DatabaseConnection.query("SELECT id, message, date_trunc('second', datetime) AS datetime FROM peeps WHERE message LIKE '%(#{keyword})%' ORDER BY datetime DESC;")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        message: peep['message'],
        datetime: peep['datetime']
      )
    end
  end

  attr_reader :id, :message, :datetime

  def initialize(id:, message:, datetime:)
    @id  = id
    @message = message
    @datetime = datetime
  end

end