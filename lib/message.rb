require './lib/database_connection'

class Message

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    sql_query = "SELECT * FROM peeps"

    result = DatabaseConnection.query(sql_query)
    result.map do |message|
      Message.new(id: message['id'], message: message['message'], date: message['created_date'])
    end
  end
end
