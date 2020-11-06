require 'PG'

class Peep

  attr_reader :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all

    connection = prod_or_test()

    result = connection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end
  end

  def self.add(message)
    connection = prod_or_test()

    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}')
                              RETURNING id, message;")

    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

  def self.prod_or_test
    return PG.connect(dbname: 'chitter_test') if ENV['ENVIRONMENT'] == 'test'

    return PG.connect(dbname: 'chitter')
    
  end

  private_class_method :prod_or_test
end
