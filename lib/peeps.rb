require 'pg'

class Peeps
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

    result = connection.exec('SELECT * FROM peeps ORDER BY peep_date DESC')
    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], date: peep['peep_date'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    post = connection.exec_params("INSERT INTO peeps (message) VALUES('#{message}') 
    RETURNING id, message, peep_date;")
    Peeps.new(id: post[0]['id'], message: post[0]['message'], date: post[0]['peep_date'])
  end
end
