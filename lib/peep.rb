require 'PG'

class Peep

  attr_reader :message

  def initialize(id, message)
    @id = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(peep['id'], peep['message'])
    end
  end
end
