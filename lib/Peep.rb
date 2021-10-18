require 'pg'


class Peep
  @@peeps

  def self.all_peeps()
    self.get_peeps()
    return @@peeps
  end

private
  def self.get_peeps()
    if ENV['ENVIRONMENT'] == "test"
      connection = PG.connect(dbname: "test_chitter")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec_params("SELECT * FROM peeps;")
    @@peeps = result.map do |row|
      {id: row["id"], message: row["message"]} 
    end
  end
    


end