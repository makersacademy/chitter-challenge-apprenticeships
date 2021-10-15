require "pg"
require "time"

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
  def self.add(message, date = Time.now)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    connection.exec("INSERT INTO peeps (message, date, time) VALUES('#{message}', '#{date}', '#{date}')")
  end
  def self.date
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      { :date => peep["date"] }
    end
  end
  def self.time
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      { :time => peep["time"] }
    end
  end
end
