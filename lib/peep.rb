require 'pg'

class Peep

  attr_reader :message
  
  def initialize(message:)
    @message = message
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end

    result = connection.exec('SELECT * FROM peeps;')
    result.map do |bookmark| 
      Peep.new(message: bookmark['message'])
    end
  end

  def self.create(message:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                  else
                    PG.connect(dbname: 'chitter')
                 end

    connection.exec("INSERT INTO peeps (message) VALUES ('#{message}');")
  end

end
