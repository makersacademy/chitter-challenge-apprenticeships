class Peep
  attr_reader :message, :date

  def initialize(id, message, date)
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

    result = connection.exec("SELECT * FROM peeps ORDER By date DESC;")
    result.map do |peep|
      Peep.new(peep['id'], peep['message'], peep['date'])
    end
  end

  def self.create(message, date)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}');")
  end
end
