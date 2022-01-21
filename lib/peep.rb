require_relative './database_connection.rb'

class Peep

  attr_reader :message, :time_added
  @@order = 'DESC'

  def initialize(message:, time_added:)
    @message = message
    @time_added = time_added
  end

  def self.all(filter = "")
    sql_string = "SELECT * FROM peeps" \
      " WHERE message LIKE '%#{filter}%'" \
      "ORDER BY time_added #{@@order}"
    all_peeps = DatabaseConnection.query(sql_string)
    all_peeps.map { |peep| Peep.new(message: peep['message'], time_added: peep['time_added']) }
  end

  def self.toggle_order
    order_mapping = { 'DESC' => 'ASC', 'ASC' => 'DESC' }
    @@order = order_mapping[@@order]
  end

  def self.create(new_peep)
    time_of_peep = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    sql_string = "INSERT INTO peeps (message, time_added)" \
      " VALUES($1, $2) " \
      "RETURNING message, time_added;"
    DatabaseConnection.query(sql_string, [new_peep, time_of_peep])
  end

end
