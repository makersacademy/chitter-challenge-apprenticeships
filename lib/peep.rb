require "pg"

class Peep
  attr_reader :id, :message, :date_posted

  def initialize(id:, message:, date_posted:)
    @id = id
    @message = message
    @date_posted = date_posted
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"], date_posted: peep["date_posted"])
    end
  end

  def self.create(message:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end
end
