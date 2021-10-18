require_relative 'peep'
require_relative 'helpers/db_connector'
class PeepAccessor
  def initialize; end

  def self.all
    peeps_arr = []
  
    rs = db_connection.exec 'SELECT * FROM peeps'

    rs.each do |row|
      peeps_arr << Peep.new(row).text
    end
    peeps_arr
  end
  
  def self.add_peep(text)
    db_connection.exec "INSERT INTO peeps(message) VALUES (\'#{text}\') "
  end

  def self.filter_peeps_by_keyword(keyword)
    filtered_peeps = []
    response = db_connection.exec "SELECT * FROM peeps WHERE message LIKE '%#{keyword}%'"

    response.each do |row| 
      filtered_peeps << row["message"]
    end

    return filtered_peeps
  end

end
