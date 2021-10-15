require "pg"

class Peep
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT message, posted_date, TO_CHAR(posted_date, 'dd/mm/yyyy') FROM peeps;")
    result.map do |peep|
      { message: peep["message"], posted_date: peep["to_char"] }
    end
  end

  def self.post(message:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end
end
