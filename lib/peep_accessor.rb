require 'peep'
require 'helpers/db_connector'
class PeepAccessor
  def initialize; end

  def self.all
    peeps_arr = []
  
    rs = db_connection.exec 'SELECT * FROM peeps'

    rs.each do |row|
      peeps_arr << Peep.new(row)
    end
    peeps_arr

  # :nocov: 
  rescue PG::Error => e
    puts e.message
  # :nocov:
  end
end
