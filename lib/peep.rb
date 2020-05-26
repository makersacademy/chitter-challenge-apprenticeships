require 'pg'
require 'date'

class Peep
  attr_reader :id, :message, :date
  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.add(message:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    date = Date.today.strftime.to_s
    result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', #{date}) RETURNING id, message, date;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
   end
end
