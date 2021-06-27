require_relative "database_connection"

class Peep
  def self.all
    peeps = DatabaseConnection.query(
      "SELECT id, message, to_char(create_time, 'DD Mon YYYY HH24:MI') as display_time 
      FROM peeps 
      ORDER BY create_time DESC;"
    )
    peeps.map { |peep|
      Peep.new(id: peep["id"], message: peep["message"], time: peep["display_time"])
    }
  end

  def self.create(message:)
    time = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    result = DatabaseConnection.query(
      "INSERT INTO peeps (message, create_time) VALUES ($1, $2) 
      RETURNING id, message, create_time;", [message, time]
    )
    Peep.new(id: result[0]["id"], message: result[0]["message"], time: result[0]["create_time"])
  end

  def self.filter(keyword:)
    peeps = DatabaseConnection.query(
      "SELECT id, message, to_char(create_time, 'DD Mon YYYY HH24:MI') as display_time
      FROM peeps 
      WHERE LOWER(message) LIKE LOWER('%#{keyword}%')
      ORDER BY create_time DESC;"
    )
    peeps.map { |peep|
      Peep.new(id: peep["id"], message: peep["message"], time: peep["display_time"])
    }
  end

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end
end
