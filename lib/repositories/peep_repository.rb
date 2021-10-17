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
    search_query = "%#{peep}%"
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE message LIKE $1", [search_query])
    result.map do |peep| 
      Peep.new(peep['message'], peep['time_stamp'], peep['id'])
    end
  end

  def add_peep(peep)
    DatabaseConnection.query("INSERT INTO peeps (message, time_stamp) values ($1, $2);", 
[peep, DateTime.now])
  end
end
