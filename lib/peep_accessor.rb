require 'peep'
class PeepAccessor
  def initialize; end

  def self.all
    peeps_arr = []
    database_name = 'chitter_test'
    con = PG.connect dbname: database_name, user: ENV['USER']

    rs = con.exec 'SELECT * FROM peeps'

    rs.each do |row|
      peeps_arr << Peep.new(row)
    end
    peeps_arr

  # :nocov: 
  rescue PG::Error => e
    puts e.message
  # :nocov:
  ensure
    rs&.clear
    con&.close
  end
end