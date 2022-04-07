require 'pg'

class Messages
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |m|
      Messages.new(id: m['id'], message: m['message'])
      m['message']
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (message) VALUES ($1) RETURNING id, message;", [message]
    )
    Messages.new(id: result[0]['id'],message: result[0]['message'])
  end
end
