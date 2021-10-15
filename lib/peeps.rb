require "pg"

class Peeps
  # def initialize
  # end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT message FROM peeps;")
    result.map { |peep| peep["message"] }
  end

  def self.create(message)
    @message = message
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}');")
  end
end
