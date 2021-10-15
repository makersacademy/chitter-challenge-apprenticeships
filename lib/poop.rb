require 'pg'

class Poop
  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'shtter_test')
    else
      connection = PG.connect(dbname: 'shtter')
    end
    poops = []
    result = connection.exec("SELECT * FROM poops;")
    result.map do |poop|
      poops.push(message: poop["message"], created_at: Time.parse(poop["created_at"]))
    end
    poops
  end

  def self.create(message)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: 'shtter_test')
    else
      connection = PG.connect(dbname: 'shtter')
    end
    connection.exec("INSERT INTO poops (message) VALUES ('#{message}');")
  end
end