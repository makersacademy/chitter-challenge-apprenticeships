require 'pg'

class Peep

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  attr_reader :id, :message

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'])
    end   
  end

end
