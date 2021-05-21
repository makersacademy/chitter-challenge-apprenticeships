require 'pg'
require_relative 'database_connection'

class Peeps

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        message: peep['message']
      )
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message")
    Peeps.new(id: result[0]['id'], message: result[0]['message'])
  end

  attr_reader :id, :message

  def initialize(id:, message:)
    @id  = id
    @message = message
  end
end