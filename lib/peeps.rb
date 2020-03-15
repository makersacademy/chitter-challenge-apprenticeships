require 'pg'

class Peeps
 attr_reader
  def initialize
    @peep
  end

  def view_all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peeps| peeps['message'] }
  end
end
