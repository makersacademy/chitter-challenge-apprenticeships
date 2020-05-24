require 'pg'

class Comments

  attr_reader :message

  def initialize(message:)
    @message = message
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Comments.new(message: peep['message'] )
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message")
    Comments.new( message: result[0]['message'] ) 
  end
end