require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      peep['message']
    end
  end
end
