require "pg"

class Peep
  attr_reader :id, :message, :posted_date

  def initialize(id:, message:, posted_date:)
    @id = id
    @message = message
    @posted_date = posted_date ? Date.parse(posted_date) : Date.today
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT id, message, posted_date, TO_CHAR(posted_date, 'dd/mm/yyyy') FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep["id"], message: peep["message"], posted_date: peep["posted_date"])
    end
  end

  def self.post(message:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, posted_date;")
    Peep.new(id: result[0]["id"], message: result[0]["message"], posted_date: result[0]["to_char"])
  end

  def pretty_date
    posted_date.strftime("- Peeped on %d/%m/%Y")
  end
end
