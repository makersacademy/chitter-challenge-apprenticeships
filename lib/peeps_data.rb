class PeepsData
  attr_reader :id, :peep

  def initialize(id = '', peep = '')
    @id = id
    @peep = peep
  end

  def self.list
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY date DESC;')
    result.map { |peep_info| Peep.new(peep_info['message'], peep_info['date']) }
  end

  def self.list_by_keyword(keyword)
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';"
    )
    result.map { |peep_info| Peep.new(peep_info['message'], peep_info['date']) }
  end

  def self.delete_peep(id)
    DatabaseConnection.query("DELETE FROM peeps WHERE id=#{id.to_i} ORDER BY date DESC;")
    list
  end

  def self.add(peep)
    DatabaseConnection.query(
      "INSERT INTO peeps (message,date) VALUES('#{peep.message}','#{peep.date}')"
    )
    list
  end

  def self.delete_table
    DatabaseConnection.query('DROP TABLE IF EXISTS peeps;')
  end

  def self.create_table
    DatabaseConnection.query(
      'CREATE TABLE peeps(id SERIAL PRIMARY KEY,message VARCHAR(60),date DATE);'
    )
  end
end
