require 'pg'
require_relative 'database_connection'

class Peeps

  def self.all
    result = DatabaseConnection.query("SELECT id, message, date, date_trunc('second', datetime) AS datetime FROM peeps ORDER BY datetime DESC;")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        message: peep['message'],
        datetime: peep['datetime'],
        date: peep['date']
      )
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date, date_trunc('second', datetime) AS datetime")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'], datetime: result[0]['datetime'])
  end

  def self.like(keyword:)
    search = DatabaseConnection.query("SELECT id, message, date, date_trunc('second', datetime) AS datetime FROM peeps WHERE message LIKE ('%#{keyword}%') ORDER BY datetime DESC;")
    search.map do |peep|
      Peeps.new(
        id: peep['id'],
        message: peep['message'],
        datetime: peep['datetime'],
        date: peep['date']
      )
    end
  end

  attr_reader :id, :message, :datetime, :date

  def initialize(id:, message:, datetime:, date:)
    @id  = id
    @message = message
    @datetime = datetime
    @date = date
  end

end