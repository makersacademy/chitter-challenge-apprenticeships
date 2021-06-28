require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;")
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

end