require 'PG'

class Peep

  attr_reader :message

  def initialize(id, message)
    @id = id
    @message = message
  end

  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(peep['id'], peep['message'])
    end
  end
end
