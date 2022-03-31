require 'pg'

class Peeps

  attr_reader :id, :message, :entry_date
  
  def initialize(id:, message:, entry_date:)
    @id = id
    @message = message
    @entry_date = entry_date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else  
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], entry_date: peep['entry_date'])
    end
  end

  def self.create(message:, entry_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else  
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO peeps (message, entry_date) VALUES($1, $2) RETURNING id, message, entry_date;", [message, entry_date])
    Peeps.new(id: result[0]['id'], message: result[0]['message'], entry_date: result[0]['entry_date'])
  end
end