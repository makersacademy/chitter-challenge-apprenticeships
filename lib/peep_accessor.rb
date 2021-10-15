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

end
