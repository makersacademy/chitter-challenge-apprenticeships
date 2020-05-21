require 'pg'

class Chits
  def chits
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |chits| chits['message'] }
  end
end
