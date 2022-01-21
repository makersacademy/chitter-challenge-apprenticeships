class Peeps

  require 'pg'

  attr_accessor :message , :date 

  def initialize(message:, date:)
    @date = date
    @message = message 
  end 

  def self.list 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
  end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peeps| Peeps.new(message: peeps['message'],date: peeps['date']) }
  end
 
  def self.create(message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params("INSERT INTO peeps (message, date) VALUES($1, $2) RETURNING id, message, date;", [message, date])
  Peeps.new(message: result[0]['message'], date: result[0]['date'])
  end

end 