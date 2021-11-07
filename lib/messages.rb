require 'pg'

class Messages
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peeps| peeps['message'] }
  end
end