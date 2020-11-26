require 'pg'
require 'date'

class Peep

  attr_reader :peep, :time

  def initialize(peep:, time:)
    @peep = peep
    @time = time
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    data = connection.exec("SELECT * FROM peeps;")
    data.map{ |peep| Peep.new(peep: peep['message'], time:peep['date']  ) }
    # data.map do |peep|
    #   Peep.new(peep: peep['message'], time: peep['date'])
    # end

  end

  def self.add(peep:, time: Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    connection.exec("INSERT INTO peeps (message, date) VALUES('#{peep}', '#{time}') RETURNING message, date;")
  end
end
