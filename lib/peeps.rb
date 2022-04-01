require_relative 'database_connection'

class Peeps

  attr_reader :id, :peep, :date
  
  def initialize(id:, peep:, date:)
    @id = id
    @peep = peep
    @date = date
  end

  def self.create(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (message) VALUES ('#{peep}') RETURNING id, message, date;"
    )
    Peeps.new(id: result[0]['id'], peep: result[0]['message'], date: result[0]['date'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        peep: peep['message'],
        date: peep['date']
      )
    end
  end

  def self.search_by_keyword(keyword:)
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';"
    )
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        peep: peep['message'],
        date: peep['date']
      )
    end
  end
end
