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

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.create(message="default peep", date=Time.now)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    new_peep = connection.exec_params(
      "INSERT INTO peeps (message, date) VALUES($1, $2) RETURNING  id, message;", [message, date]
      )
    Peep.new(id: new_peep[0]['id'], message: new_peep[0]['message'], date: new_peep[0]['date'])
  end
end
