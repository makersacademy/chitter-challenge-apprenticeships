require "pg"
require "date"

class Peep
  attr_reader :id, :message, :datetime

  def initialize(id:, message:, datetime:)
    @id = id
    @message = message
    @datetime = datetime
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec ("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"], datetime: peep["datetime"])
    end
  end

  def self.add(message:, datetime:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec_params("INSERT INTO peeps (message, datetime) VALUES ('#{message}', '#{datetime}') RETURNING id, message, datetime;")
    Peep.new(id: result[0]["id"], message: result[0]["message"], datetime: result[0]["datetime"])
  end

  def self.sort
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec ("SELECT * FROM peeps ORDER BY datetime DESC")
    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"], datetime: peep["datetime"])
    end
  end
end
