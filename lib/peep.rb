require '/Users/ok/Projects/individual-challenges/chitter-challenge-apprenticeships/lib/db_connection.rb'
require 'time'

class Peep
  def self.all
    result = DBConnection.query('chitter', '
      SELECT * FROM peeps
    ')
    result.map { |peep| {
      message: peep['message'],
      time: peep['time']
    } }
  end

  def self.post(message:)
    result = DBConnection.query('chitter', "
      INSERT INTO peeps (message, time)
      VALUES ('#{message}', '#{Time.now.strftime("%k:%M - %d/%m/%y")}')
      RETURNING id, message, time
    ")
    result.map { |peep| {
      id: peep['id'],
      message: peep['message'],
      time: peep['time']
    } }
  end
end
