require "pg"

class Chitter
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("select * from peeps order by date DESC;")
  end
  def self.create(message:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec_params("INSERT INTO peeps (message) VALUES($1) RETURNING id, message;", [message])
  end
end
