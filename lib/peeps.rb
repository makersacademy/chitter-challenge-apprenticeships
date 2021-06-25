require 'pg'

class Peeps

  attr_reader :message, :date

  def initialize(message:, date:)
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps;')
    
    result.map do |peep| 
      Peeps.new(message: peep['message'], date: peep['date'])
    end

  end

  def self.add(peep)

    date = Time.new

    store_date = "#{date.hour}:#{date.min}, #{date.day}.#{date.month}.#{date.year}"

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message, date) values ('#{peep}', '#{store_date}');")

  end



end