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
      { :id => "1", :message => "Testing, Testing 123" }
    end
  end
end
