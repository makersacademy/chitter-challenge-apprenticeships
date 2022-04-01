require_relative 'database_connection'

class Peeps

  attr_reader :id, :peep
  
  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.create(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (message) VALUES ('#{peep}') RETURNING id, message;"
    )
    Peeps.new(id: result[0]['id'], peep: result[0]['message'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(
        id: peep['id'],
        peep: peep['message']
      )
    end
  end

end
