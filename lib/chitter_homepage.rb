require 'pg'

class Chitter_Page
  def self.view
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    total = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")

    total.map do |peep|
      { message: peep["message"], date_posted: peep["date_posted"] }
    end
  end


  def self.create(message)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end 

    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end

end