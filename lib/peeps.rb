require 'pg'

class Peeps
  def self.all
    connection = PG.connect(dbname: 'chitter')
    rs = connection.exec('SELECT * FROM peeps;')
    rs.map { |peeps| peeps['message'] }
  end
end