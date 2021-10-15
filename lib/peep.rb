require "pg"

class Peep
  def self.view
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      { :message => peep["message"] }
    end
  end
end
