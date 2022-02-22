require 'pg'

class ChitterManager

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY peep_date DESC;")
    result.map do |peep| 
      ChitterManager.new(id: peep['id'], message: peep['message'], date: peep['peep_date'])
    end
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end

    peep = message.gsub(/'/, "''")
    post = connection.exec("INSERT INTO peeps (message) VALUES ('#{peep}') RETURNING id, message, peep_date;")
    ChitterManager.new(id: post[0]['id'], message: post[0]['message'], date: post[0]['peep_date'])
  end

end
