require './lib/database_connection'

class Message

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    sql_query = "SELECT id, message, date_trunc('second', created_date) FROM peeps;"

    result = DatabaseConnection.query(sql_query)
    result.map do |message|
      Message.new(id: message['id'], message: message['message'], date: message['date_trunc'])
    end
  end

  def self.create(message)
    sql_query = "INSERT INTO peeps (message) VALUES ($1) RETURNING id, message, created_date;"

    result = DatabaseConnection.query(sql_query, [message])

    Message.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['created_date'])
  end
end
