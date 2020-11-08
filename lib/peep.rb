require 'date'
require 'database_connection'

class Peep

  attr_reader :message, :time_sent

  def initialize(id:, message:, time_sent:)
    @id = id
    @message = message
    @time_sent = time_sent
  end

  def self.all

    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time_sent DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time_sent: peep['time_sent'])
    end
  end

  def self.add(message)

    result = DatabaseConnection.query("INSERT INTO peeps (message, time_sent)
                              VALUES ('#{message}', '#{time_sent()}')
                              RETURNING id, message, time_sent;")

    Peep.new(id: result[0]['id'],
             message: result[0]['message'],
             time_sent: result[0]['time_sent'])
  end

  def self.time_sent
    today = Time.now
    day = today.day.to_s
    month = today.month.to_s
    year = today.year.to_s
    return year + '-' + month + '-' + day
  end

  private_class_method :time_sent
end
