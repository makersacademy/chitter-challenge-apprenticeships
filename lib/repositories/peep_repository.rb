require_relative '../database/database_connection'

class PeepRepository
  def initialize
    
  end

  def find_all_peeps
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep| 
      Peep.new(peep['message'], peep['time_stamp'], peep['id'])
    end
  end
end