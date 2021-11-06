require 'pg'

class Peep
  attr_reader :message

  def initialize(message:)
    @message = message
  end

  def self.all
    result = 
      DatabaseConnection.query('SELECT * FROM peeps ORDER BY id DESC;')
      result.map do |peep| 
        Peep.new(message: peep['message'])
      end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING message;")
    Peep.new(message: result[0]['message'])
  end
end
