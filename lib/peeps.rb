require 'pg'
require_relative 'dbcon'

class Peep

  attr_reader :id, :message

  def initialize(id, message)
    @id = id
    @message = message
  end

  def self.all

    table  = DatabaseConnection.query('SELECT * FROM peeps;') # within database, connecting to table
    table.map { |result| Peep.new(result['id'], result['message']) }
  end

end
