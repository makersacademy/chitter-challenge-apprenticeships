require 'pg'

class Peeps
  
  attr_reader :id, :date, :message

  def initialize(id:, date:, message:)
      @id = id
      @date = date
      @message = message
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Peeps.new(id: peep['id'], date: peep['date'], message: peep['message']) 
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

  result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, date, message")
    Peeps.new(id: result[0]['id'], date: result[0]['date'], message: result[0]['message'])
  end

  def self.filter(keyword)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps WHERE message LIKE ('%#{keyword}%')")
    result.map { |peep| Peeps.new(id: peep['id'], date: peep['date'], message: peep['message']) }
  end
end

