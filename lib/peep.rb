require "pg"

class Peep
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT message, date_posted, TO_CHAR(date_posted, 'dd/mm/yyyy') FROM peeps ORDER BY date_posted DESC;")
    result.map do |peep|
      { message: peep["message"], date_posted: peep["to_char"] }
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
