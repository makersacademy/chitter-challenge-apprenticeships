require 'pg'

class Peeps

  attr_reader :id, :message, :date
  def initialize(id, message, date)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")

    result.map do |peep|
      Peeps.new(peep['id'], peep['message'], peep['date'])
    end
  end

  def self.add(new_message)
    date = Time.now.strftime("%Y-%m-%d")
    result = DatabaseConnection.query("INSERT INTO peeps (message, date) VALUES ('#{new_message}', '#{date}') RETURNING id, message, date;")
    Peeps.new(result[0]['id'], result[0]['message'], result[0]['date'])
  end

  def self.filter(keyword)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';")

    result.map do |peep|
      Peeps.new(peep['id'], peep['message'], peep['date'])
    end
  end
end
