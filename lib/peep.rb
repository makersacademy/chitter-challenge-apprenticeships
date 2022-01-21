require 'pg'

class Peep

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    results = connect.exec("SELECT * FROM peeps ORDER BY date DESC;")
    results.map { |peep| Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])}
  end

  def self.create(message)
    connect.exec("INSERT INTO peeps (message, date) values ('#{message}', 'NOW()');")
  end

  def self.filtered(keyword)
    results = connect.exec("SELECT * FROM peeps WHERE LOWER(message) LIKE '%#{keyword.downcase}%' ORDER BY date DESC;")
    results.map { |peep| Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])}
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
