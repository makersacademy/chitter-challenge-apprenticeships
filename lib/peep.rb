require "pg"

class Peep 
  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @message = message
    @id = id
    @date = date
  end

  def self.create(message:, date: Date.today.to_s)
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec_params(
      "INSERT INTO peeps (message, date) VALUES ($1, $2) RETURNING id, message, date", 
      [message, date]
      )
    Peep.new(id: result[0]["id"], message: result[0]["message"], date: result[0]["date"])
  end

  def self.all
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"], date: peep["date"])
    end
  end

  def self.sort_by_date
    if ENV["RACK_ENV"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY date DESC")
    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"], date: peep["date"])
    end
  end

end
