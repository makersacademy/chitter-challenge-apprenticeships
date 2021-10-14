require "pg"

class Peep
  def self.show_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: "chitter_test"
    else
      connection = PG.connect dbname: "chitter"
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |row|
      { username: row["username"], post: row["message"] }
    end
  end

end