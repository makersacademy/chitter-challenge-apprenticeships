require "pg"

class Peep
  def self.all
    db = PG.connect(dbname: "chitter")

    peeps = db.exec("SELECT * FROM peeps;")
    peeps.map { |peep| peep["message"] }
  end
end
