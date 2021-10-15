require "pg"

class Peeps
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
  def self.add(message, time = Time.now)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    connection.exec("INSERT INTO peeps (message, time) VALUES('#{message}', '#{time}')")
  end
end
