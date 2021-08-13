require 'pg'
require 'time'

class Peep
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

    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep| 
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        date: peep['date']
      )
    end
  end

  def self.create(message:)
    self.set_date
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec_params("INSERT INTO peeps (message, date, date_time) VALUES($1, $2, $3) RETURNING id, message, date;", [message, @date, @date_time])
    Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

  private

  def self.set_date
    date_total = Time.new
    @date = "#{date_total.strftime("%m/%d/%Y at %H:%M")}"
    @date_time = "#{date_total.strftime("%m/%d/%Y at %H:%M:%S:%L:%N")}"
  end
end