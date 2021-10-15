require "pg"

class Peeps
  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |message| Peeps.new(id: message["id"], message: message["message"], date: message["date"]) }
  end

  def self.create(message)
    p date = date_posted
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec_params("INSERT INTO peeps (message, date) VALUES ($1, $2);", [message, date])
  end
end

private

def date_posted
  Time.now
end
