require "pg"

class Chitter
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("select * from peeps;")
  end
  def self.create(message:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    # connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message ")
    result = connection.exec_params("INSERT INTO peeps (message) VALUES($1) RETURNING id, message;", [message])
  end
end
