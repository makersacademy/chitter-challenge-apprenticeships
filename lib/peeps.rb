require 'pg'

class Peeps
  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.date
    Time.now.strftime("%Y-%m-%d")
  end

  def self.add(new_message)
    result = DatabaseConnection.query("INSERT INTO peeps (message, date) VALUES ('#{new_message}', '#{date}') RETURNING id, message, date;")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

  def self.filter(keyword)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';")

    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end
end
