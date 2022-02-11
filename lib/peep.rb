require 'pg'

class Peep
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

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(message: peep['message'], date: peep['date'])
    end
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec_params("INSERT INTO peeps (message, date)
      VALUES($1, $2);", [message, Time.now.to_s[0, 9]]
    )
  end

  def self.filter(keyword)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("SELECT * FROM peeps WHERE message LIKE($1)", ["%#{keyword}%"]
    )
    result.map do |peep|
      Peep.new(message: peep['message'], date: peep['date'])
    end
  end
end
