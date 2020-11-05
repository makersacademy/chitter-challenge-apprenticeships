require 'pg'

class Peeps

  attr_reader :id, :message, :date
  def initialize(id, message, date)
    @id = id
    @message = message
    @date = date
  end

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    connection = connect
    result = connection.exec("SELECT * FROM peeps;")

    result.map do |peep|
      Peeps.new(peep['id'], peep['message'], peep['date'])
    end
  end

  def self.add(new_message)
    connection = connect
    date = Time.now.strftime("%Y-%m-%d")

    result = connection.exec("INSERT INTO peeps (message, date) VALUES ('#{new_message}', '#{date}') RETURNING id, message, date;")
    Peeps.new(result[0]['id'], result[0]['message'], result[0]['date'])
  end
end
