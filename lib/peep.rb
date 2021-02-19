require 'pg'

class Peep

  attr_reader :message, :date
  
  def initialize(message:, date:)
    @message = message
    @date = date
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY id DESC;')
    result.map do |peep| 
      Peep.new(message: peep['message'], date: peep['date'])
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, date) VALUES ('#{message}', '#{Time.now.strftime("%d/%m/%Y")}') RETURNING message, date;")
    Peep.new(message: result[0]['message'], date: result[0]['date'])
  end

end
