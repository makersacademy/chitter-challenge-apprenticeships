class Peep
  attr_reader :id, :message, :date

  def initialize(id, message, date)
    @id = id
    @message = message  
    @date = date  
  end

  def self.all
    connection = DatabaseConnection.start
    result = connection.exec("SELECT * FROM peeps ORDER By date DESC;")
    Peep.peeps(result)
  end

  def self.filtered(search_keyword)
    connection = DatabaseConnection.start
    result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{search_keyword}%' ORDER By date DESC;")
    Peep.peeps(result)
  end

  def self.create(message, date)
    connection = DatabaseConnection.start
    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}');")
  end

  def self.delete(id)
    connection = DatabaseConnection.start
    connection.exec("DELETE FROM peeps WHERE id = '#{id}';")
  end

  private
  def self.peeps(result)
    result.map do |peep|
      Peep.new(peep['id'], peep['message'], peep['date'])
    end
  end
end
