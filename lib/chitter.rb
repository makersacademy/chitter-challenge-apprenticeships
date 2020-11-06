require 'pg'
require 'date'

class Peeps

  attr_reader :id, :message, :date

  TODAY = Time.new.day.to_s + "-" + Time.new.month.to_s + "-" + Time.new.year.to_s

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    establish_connection
    result = @connection.exec("SELECT * FROM peeps ORDER BY date DESC, id DESC;")
    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.post(cheep:)
    establish_connection
    result = @connection.exec("INSERT INTO peeps (message, date) VALUES ('#{cheep}', '#{TODAY}') RETURNING id, message, date")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

  def self.establish_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end
end
