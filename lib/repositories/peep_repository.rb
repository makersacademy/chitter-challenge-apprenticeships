require_relative '../database/database_connection'
require_relative '../domain/peep'

class PeepRepository
  def initialize
    
  end

  def find_all_peeps
    result = DatabaseConnection.query('SELECT * FROM peeps')
    result.map do |peep| 
      Peep.new(peep['message'], peep['time_stamp'], peep['id'])
    end
  end

  def find_all_peeps_with_filter(peep)
    result = DatabaseConnection.query('SELECT * FROM peeps WHERE content LIKE %$1%', [peep])
    result.map do |peep| 
      Peep.new(peep['message'], peep['time_stamp'], peep['id'])
    end
  end
end
