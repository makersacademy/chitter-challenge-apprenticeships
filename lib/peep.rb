require 'pg'

class Peep

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end
  
  def self.connection
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
      connection = PG.connect(dbname: 'chitter')
    end
  end


  def self.all
    self.connection

    result = connection.exec("SELECT * FROM peeps ORDER BY date DESC")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end

  end

  def self.create(message:, date:)
    self.connection

    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}') RETURNING id, message, date")
  end


  def self.find(keyword)
    self.connection

    result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%'")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end
end