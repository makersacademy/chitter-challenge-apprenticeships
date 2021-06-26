require "pg"

class Peep
  def self.all
    self.environment
    peeps = @connection.exec("SELECT id, message, to_char(create_time, 'DD Mon YYYY HH24:MI') as display_time FROM peeps ORDER BY create_time DESC;")
    peeps.map { |peep|
      Peep.new(id: peep["id"], message: peep["message"], time: peep["display_time"])
    }
  end

  def self.create(message:)
    self.environment
    time = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    result = @connection.exec_params(
      "INSERT INTO peeps (message, create_time)
      VALUES ('#{message}', '#{time}') RETURNING id, message, create_time;"
    )
    Peep.new(id: result[0]["id"], message: result[0]["message"], time: result[0]["create_time"])
  end

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  private

  def self.environment
    if ENV["ENVIRONMENT"] == "test"
      @connection = PG.connect(dbname: "chitter_test")
    else
      @connection = PG.connect(dbname: "chitter")
    end
  end
end
