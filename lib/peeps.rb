require 'pg'

class Peeps

  attr_reader :id, :peep, :date

  def initialize(id:,peep:,date:)
    @id = id
    @peep = peep
    @date = date
  end

  def self.all
    connection = self.environment
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['message'], date: peep['date'])
    end
  end

  def self.add(peep:, date: Time.new.strftime("%I:%M %p - %B %d, %Y"))
    connection = self.environment
    result = connection.exec("INSERT INTO peeps (message, date) VALUES ('#{peep}', '#{date}') RETURNING id, message, date;")
    Peeps.new(id: result[0]['id'], peep: result[0]['message'], date: result[0]['date'])
  end

  def self.search(keyword:)
    connection = self.environment
    result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%' ORDER BY id DESC;")
    result.map do |peep|
      Peeps.new(id: peep['id'], peep: peep['message'], date: peep['date'])
    end
  end    

  private

  def self.environment
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
