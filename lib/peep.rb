require "pg"

class Peep
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "chitter_test")
    else
      db = PG.connect(dbname: "chitter")
    end

    peeps = db.exec("SELECT * FROM peeps;")
    peeps.map { |peep| peep["message"] }
  end

  def self.create(peep)
    if ENV["ENVIRONMENT"] == "test"
      db = PG.connect(dbname: "chitter_test")
    else
      db = PG.connect(dbname: "chitter")
    end
    db.exec("INSERT INTO peeps (message) VALUES ('#{peep}');")
  end
end
