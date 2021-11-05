require 'pg'

class Peep

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    all_peeps = connection.exec("SELECT * FROM peeps")
    all_peeps.map { |peep| peep['message'] }
  end

end