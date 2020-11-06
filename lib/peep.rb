require '/Users/ok/Projects/individual-challenges/chitter-challenge-apprenticeships/lib/db_connection.rb'

class Peep
  def self.all
    result = DBConnection.query('chitter',
      'SELECT * FROM peeps')
    result.map { |peep| { message: peep['message'] } }
  end

  def self.post(message:)
    result = DBConnection.query('chitter',
      "INSERT INTO peeps (message)
       VALUES ('#{message}')")
  end
end
