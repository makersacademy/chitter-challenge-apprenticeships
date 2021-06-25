require "pg"

class Peep
  def self.all
    self.environment
    peeps = @connection.exec("SELECT * FROM peeps;")
    peeps.map { |peep|
      Peep.new(id: peep["id"], message: peep["message"], time: peep["time"])
    }
  end

  def self.create(message:)
    self.environment
    time = Time.new.strftime("%d-%m-%Y %H:%M")
    result = @connection.exec_params(
      "INSERT INTO peeps (message, time)
      VALUES ('#{message}', '#{time}') RETURNING id, message, time;"
    )
    Peep.new(id: result[0]["id"], message: result[0]["message"], time: result[0]["time"])
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
