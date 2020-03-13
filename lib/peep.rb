require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peeps| peeps['message'] }
    # [
    #   'This is a peep!',
    #   'I saw a fox!'
    # ]
  end
end
