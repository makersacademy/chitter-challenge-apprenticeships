require 'pg'

class ChitterMessage

 

  def self.all
    objarr = []
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps')
    result.each do |row|
      objarr.push({"msg" => row["message"], "dt" => row["date"]})
    end
    objarr
  end

end

