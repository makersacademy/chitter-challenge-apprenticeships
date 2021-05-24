require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    list = result.map do |peep|
    Peep.new(
        id: peep['id'],
        message: peep['message'],
        date: peep['date']
      )
    end
    list.reverse
  end

  def self.list
    DatabaseConnection.query('SELECT * FROM peeps ORDER BY id DESC')
  end

  def self.create(message: )
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end
end
