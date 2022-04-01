require "pg"

class Peep 
  attr_reader :id, :message

  def initialize(id:, message:)
    @message = message
    @id = id
  end

  def self.create(message:)
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec_params(
      "INSERT into peeps (message) VALUES ($1) RETURNING id, message", 
      [message]
      )
    Peep.new(id: result[0]["id"], message: result[0]["message"])
  end

  def self.all
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"])
    end
  end
end
