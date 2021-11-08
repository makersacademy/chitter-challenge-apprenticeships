require 'database_connection'

class Peep

  attr_reader :peep, :time_added
  @@order_by = 'DESC'

  def initialize(peep:, time_added:)
    @peep = peep
    @time_added = time_added
  end

  def self.all(filter = "")
    query = "SELECT * FROM peeps #{filter} ORDER BY time_added #{@@order_by}"
    all_peeps = DatabaseConnection.query(query)
    all_peeps.map { |peep| Peep.new(peep: peep['message'], time_added: peep['time_added']) }
  end

  def self.toggle_order
    @@order_by = (@@order_by == 'DESC') ? 'ASC' : 'DESC'
  end

  def self.create(new_peep)
    time_of_peep = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    query = "INSERT INTO peeps (message, time_added) VALUES($1, $2) RETURNING message, time_added;"
    DatabaseConnection.query(query, [new_peep, time_of_peep])
  end

end
