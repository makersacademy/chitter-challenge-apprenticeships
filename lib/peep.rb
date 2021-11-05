require 'pg'

class Peep

  attr_reader :peep, :time_added

  def initialize(peep:, time_added:)
    @peep = peep
    @time_added = time_added
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.all 
    connection = Peep.connect
    all_peeps = connection.exec("SELECT * FROM peeps")
    all_peeps.map { |peep| Peep.new(peep: peep['message'], time_added: peep['time_added']) }
  end

  def self.create(new_peep)
    connection = Peep.connect
    time_of_peep = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    query = "INSERT INTO peeps (message, time_added) VALUES($1, $2) RETURNING message, time_added;"
    connection.exec_params(query, [new_peep, time_of_peep])
  end

end
