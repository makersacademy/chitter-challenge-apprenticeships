require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :message, :posted_on

  def initialize(id:, message:, posted_on:)
    @id = id
    @message = message
    @posted_on = posted_on
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    list = result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        posted_on: peep['posted_on']
      )
    end
    list.reverse
  end

  def self.create(message: )
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, posted_on;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], posted_on: result[0]['posted_on'])
  end

  def self.find(keyword)
    search = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE ('%#{keyword}%')")
    search.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        posted_on: peep['posted_on']
      )
    end
  end

end
