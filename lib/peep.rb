require 'pg'

class Peep

  attr_reader :message, :date

  def initialize(message:, date:)
    @message = message
    @date = date
  end
  
  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    connection

    result = connection.exec("SELECT * FROM peeps ORDER BY date DESC")
    result.map do |peep| 
      Peep.new(message: peep['message'], date: peep['date'])
    end
  end

  def self.create(message:, date:)
    connection

    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}') 
                      RETURNING id, message, date")
  end

  def self.find(keyword)
    connection

    result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%'")
    result.map do |peep|
      Peep.new(message: peep['message'], date: peep['date'])
    end
  end
end
