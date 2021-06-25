class Peep
  attr_reader :message, :date

  def initialize(id, message, date)
    @id = id
    @message = message  
    @date = date  
  end

  def self.all
    connection = Peep.connection
    result = connection.exec("SELECT * FROM peeps ORDER By date DESC;")
    Peep.peeps(result)
  end

  def self.filtered(search_keyword)
    connection = Peep.connection
    result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{search_keyword}%' ORDER By date DESC;")
    Peep.peeps(result)
  end

  def self.create(message, date)
    connection = Peep.connection
    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}');")
  end

  private
  def self.peeps(result)
    result.map do |peep|
      Peep.new(peep['id'], peep['message'], peep['date'])
    end
  end

  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end
end
