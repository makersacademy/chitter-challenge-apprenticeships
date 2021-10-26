require "pg"

class Peep
  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.view
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    all_peeps = connection.exec("SELECT * FROM peeps;")
    result = all_peeps.map do |peep|
      Peep.new(
        id: peep["id"].to_i,
        message: peep["message"],
        date: peep["date"],
      )
    end
  end

  def self.post(message:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    date = Date.today.strftime("%Y-%m-%d")
    peep = connection.exec("INSERT INTO peeps (message, date) 
    VALUES('#{message}', '#{date}')
    RETURNING id, message, date;")
    result = Peep.new(
      id: peep[0]["id"].to_i,
      message: peep[0]["message"],
      date: peep[0]["date"],
    )
  end
end
